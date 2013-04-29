require 'sidekiq'


Sidekiq.configure_server do |config|
  config.redis = {
    :url       => ENV['WORKER_REDIS_URL'],
    :namespace => ENV['WORKER_REDIS_NS']
  }
end

Sidekiq.configure_client do |config|
  config.redis = {
    :url       => ENV['WORKER_REDIS_URL'],
    :namespace => ENV['WORKER_REDIS_NS']
  }
end
