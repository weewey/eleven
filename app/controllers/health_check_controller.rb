class HealthCheckController < ActionController::Base

  def health_check
    head :ok
  end
end
