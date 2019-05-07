require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Eleven
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.time_zone = 'Singapore'

    Dir["#{Rails.root}/app/clients/*"].each do |path|
      config.autoload_paths << path
    end

    Dir["#{Rails.root}/app/services/*"].each do |path|
      config.autoload_paths << path
    end

    Dir["#{Rails.root}/app/models/*"].each do |path|
      config.autoload_paths << path
    end

  end
end
