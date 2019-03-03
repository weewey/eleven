class Result
  attr_reader :error_message, :params

  class << self
    def success(params = {})
      new(true, nil, params)
    end

    def failure(error_message, params = {})
      new(false, error_message, params)
    end
  end

  def initialize(success, error_message, params = {})
    @success = success
    @error_message = error_message
    @params = params
  end

  def success?
    @success
  end
end
