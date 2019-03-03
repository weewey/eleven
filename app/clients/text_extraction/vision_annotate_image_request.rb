class VisionAnnotateImageRequest
  def initialize(img_url)
    @img_url = img_url
  end

  def to_json
    {
      "requests": [
        {
          "image": {
            "source": {
              "gcsImageUri": @img_url,
            }
          },
          "features": [
            {
              "type": 'TEXT_DETECTION',
            }
          ]
        }
      ]
    }.to_json
  end
end