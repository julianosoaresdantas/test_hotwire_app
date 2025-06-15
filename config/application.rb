# config/application.rb

require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module HotwireApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 8.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed after this file.
    #
    # E.g.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Explicitly configure Propshaft to ensure correct JavaScript MIME type
    config.assets.configure do |env|
      env.register_mime_type "application/javascript", ".js"
      env.register_mime_type "application/json",      ".json"
      # You can add other common types if needed, but .js is crucial here
    end
  end
end
