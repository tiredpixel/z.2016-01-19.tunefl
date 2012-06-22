Resque.redis = Redis.new(
  :host     => ENV['RESQUE_REDIS_HOST'],
  :port     => ENV['RESQUE_REDIS_PORT'],
  :password => ENV['RESQUE_REDIS_PASSWORD']
)

