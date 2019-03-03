require 'rails_helper'

RSpec.describe TextExtractionService do

  describe '#execute' do
    let(:img_url) { "http://img.url" }
    let(:stub_text_extraction_client) { instance_double('TextExtractionClient') }
    let(:stub_response) { instance_double('VisionAnnotateImageResponse', success?: true, words: ["1234"]) }

    before do
      allow(TextExtractionClient).to receive(:new).and_return(stub_text_extraction_client)
      allow(stub_text_extraction_client).to receive(:extract_text).and_return(stub_response)
    end

    after do
      TextExtractionService.instance_variable_set("@client", nil)
    end

    context 'when successful' do
      it 'returns a success response with the words' do
        result = TextExtractionService.execute(img_url)
        expect(result).to be_success
        expect(result.params[:words]).to eq(["1234"])
      end
    end

    context 'when unsuccessful' do
      let(:stub_response) { instance_double('VisionAnnotateImageResponse', success?: false, error_code: 500, error_message: "Internal Server Error") }

      it 'returns an error response' do
        result = TextExtractionService.execute(img_url)
        expect(result.success?).to be false
      end

      it 'returns with the right error message' do
        result = TextExtractionService.execute(img_url)
        expect(result.error_message).to eq("Error Code: 500, Message: Internal Server Error")
      end
    end
  end

end
