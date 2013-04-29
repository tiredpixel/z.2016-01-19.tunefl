require 'sidekiq'


Sidekiq.configure_server do |config|
  config.redis = {
    :url       => ENV['worker_redis_url'],
    :namespace => ENV['worker_redis_ns']
  }
end

Sidekiq.configure_client do |config|
  config.redis = {
    :url       => ENV['worker_redis_url'],
    :namespace => ENV['worker_redis_ns']
  }
end
