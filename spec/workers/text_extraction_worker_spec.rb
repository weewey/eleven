require 'rails_helper'

RSpec.describe TextExtractionWorker, type: :worker do

  let(:photo) { create(:photo, tags: []) }

  subject { TextExtractionWorker.new }

  before do
    Sidekiq::Testing.inline!
    allow(TextExtractionService).to receive(:execute).with(photo.image.url).and_return(result)
  end

  describe '#perform' do
    let(:tags) { %w(ABCD 1234) }
    let(:result) { double('Result', success?: true, params: { words: tags }) }

    context 'when successful' do
      it 'should set the photo tags' do
        subject.perform(photo.id)
        expect(photo.reload.tags).to eq(tags)
      end
    end

    context 'when unsuccessful' do
      let(:result) { double('Result', success?: false, error_message: "Failed to extract any tags") }

      it 'raises an error' do
        expect { subject.perform(photo.id) }.to raise_error(TextExtractionError, result.error_message)
      end
    end
  end
end