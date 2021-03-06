require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Trailblazer
  class Application < Rails::Application
    config.generators do |g|
      g.assets              false
      g.helper              false
      g.template_engine     :erb

      g.view_specs          false
      g.helper_specs        false
      g.routing_specs       false
      g.request_specs       false

      g.test_framework      :rspec, :fixture => true
      g.fixture_replacement :factory_girl
    end

    config.autoload_paths += %W(
      #{config.root}/lib
    )

    config.middleware.use Rack::Cors do
      allow do
        origins '*'
        resource '/oauth/revoke', :headers => :any, :methods => [:post, :delete, :options]
        resource '/api/*', :headers => :any, :methods => [:get, :post, :put, :patch, :delete, :options]
      end
    end

    # Use the in-memory Sucker Punch as our queue adapter
    config.active_job.queue_adapter = :sucker_punch

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
  end
end
