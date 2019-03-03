require 'rails_helper'

RSpec.describe VisionAnnotateImageResponse do
  let(:response_body) { JSON.parse(File.read(Rails.root.join('spec', 'fixtures', 'vision_annotate_image_sample_response.json'))) }
  let(:response) { instance_double('Faraday::Response', status: 200, body: response_body) }

  subject { VisionAnnotateImageResponse.new(response) }

  context 'when successful' do
    it 'returns success response' do
      expect(subject.success?).to be true
    end

    it 'returns the words in a block' do
      expect(subject.words).to eq(%w(CHARTERED-MARATHON-2018 A-30130))
    end

    context 'with another response_body' do
      let(:response_body) { JSON.parse(File.read(Rails.root.join('spec', 'fixtures', 'vision_annotate_image_sample_response_2.json'))) }

      it 'returns the words in a block' do
        expect(subject.words).to eq(%w(A-30146))
      end
    end
  end

  context 'when unsuccessful' do
    let(:response_body) { { "error": { "code": 403, "message": "Forbidden" } } }
    let(:response) { instance_double('Faraday::Response', status: 403, body: response_body) }

    it 'returns the error_code' do
      expect(subject.error_code).to eq(403)
      end

    it 'returns the error_message' do
      expect(subject.error_message).to eq('Forbidden')
    end
  end

end
