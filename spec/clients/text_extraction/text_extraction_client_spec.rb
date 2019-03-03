require 'rails_helper'

RSpec.describe TextExtractionClient do

  describe '#extract_text' do
    subject { TextExtractionClient.new }

    let(:stub_vision_request) { instance_double('VisionAnnotateImageRequest', to_json: { a: 'b' }) }
    let(:stub_http_client) { instance_double('Faraday::Connection') }
    let(:stub_vision_response) { instance_double('VisionAnnotateImageResponse', success?: true, words: ["A-1234"]) }
    let(:img_url) { 'http://img-src' }

    before do
      allow(Figaro.env).to receive(:gcp_cloud_vision_api_key).and_return(1)
      allow(TextExtractionClient).to receive(:client).and_return(stub_http_client)
      allow(stub_http_client).to receive(:post)
      allow(VisionAnnotateImageRequest).to receive(:new).with(img_url).and_return(stub_vision_request)
      allow(VisionAnnotateImageResponse).to receive(:new).and_return(stub_vision_response)
    end

    it 'sends the correct request' do
      expect(stub_http_client).to receive(:post).with("/v1/images:annotate:1", stub_vision_request.to_json)
      subject.extract_text(img_url)
    end

    it 'returns success response with words' do
      result = subject.extract_text(img_url)
      expect(result.success?).to be true
      expect(result.words).to eq(['A-1234'])
    end
  end

end
