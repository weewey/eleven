class TextExtractionWorker
  include Sidekiq::Worker

  sidekiq_options retry: 0, queue: ElevenConstants::SIDEKIQ_DEFAULT_QUEUE

  def perform(photo_id)
    photo = Photo.find(photo_id)
    response = TextExtractionService.execute(photo.image.url)
    raise TextExtractionError, response.error_message unless response.success?

    photo.update!(tags: response.params[:words])
  end

end

class TextExtractionError < StandardError
end