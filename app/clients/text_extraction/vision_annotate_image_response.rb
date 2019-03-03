class VisionAnnotateImageResponse
  def initialize(response)
    @response = response
    @response.body.deep_symbolize_keys!
  end

  def success?
    status_code.equal?(200)
  end

  def status_code
    @response.status
  end

  def error_code
    return nil if success?

    @response.body[:error][:code]
  end

  def error_message
    return nil if success?

    @response.body[:error][:message]
  end

  def words
    result = []
    @response.body[:responses].first[:fullTextAnnotation][:pages].first[:blocks].each do |block|
      text = ""
      block[:paragraphs].each do |paragraph|
        paragraph[:words].each do |word|
          returned_word = ""
          word[:symbols].each do |symbol|
            returned_word += symbol[:text].upcase
          end
          text += "#{returned_word}-"
        end
      end
      result << text
    end
    result.map(&:chop)
  end

end