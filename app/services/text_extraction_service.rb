class TextExtractionService
  class << self
    def execute(img_url)
      response = client.extract_text(img_url)

      unless response.success?
        return error_response("Error Code: #{response.error_code}, Message: #{response.error_message}")
      end

      success_response(response.words)
    end

    private

    def client
      @client ||= TextExtractionClient.new
    end

    def success_response(words)
      Result.success(words: words)
    end

    def error_response(message)
      Result.failure(message)
    end
  end
end
