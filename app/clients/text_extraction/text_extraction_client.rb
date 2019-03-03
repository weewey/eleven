class TextExtractionClient

  def extract_text(img_url)
    payload = VisionAnnotateImageRequest.new(img_url)
    response = self.class.client.post("/v1/images:annotate:#{Figaro.env.gcp_cloud_vision_api_key}", payload.to_json)
    VisionAnnotateImageResponse.new(response)
  end

  class << self
    def client
      @client ||= Faraday.new(url: "#{Figaro.env.gcp_cloud_vision_base_url}") do |c|
        c.headers['Content-Type'] = 'application/json'
      end
    end
  end

end