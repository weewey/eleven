class HealthCheckController < ActionController::Base
  skip_after_action :verify_authorized

  def health_check
    head :ok
  end
end
