Sidekiq.configure_server do |config|
  config.redis = {url: 'redis://localhost:6379/4/cache', expires_in: 1.days}
  config.average_scheduled_poll_interval = 1
end

Sidekiq.configure_client do |config|
  config.redis = {url: 'redis://localhost:6379/4/cache', expires_in: 1.days}
end


