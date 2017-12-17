require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Mywebsite
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.i18n.default_locale = :"en"
    config.time_zone = "Beijing"
    config.active_record.default_timezone = :local
    config.active_job.queue_adapter = :sidekiq

    redis_config_hash = {url: 'redis://localhost:6379/3/cache',  expires_in: 1.days}

    if Sidekiq.server? # threaded context
      redis_config_hash[:pool_size] = Sidekiq.options[:concurrency] + 5
      redis_config_hash[:pool_timeout] = 1
    end
    config.cache_store = :redis_store, redis_config_hash

    console do
      # this block is called only when running console,
      # so we can safely require pry here
      require "pry"
      config.console = Pry
    end
  end
end
