uri = URI.parse(ENV['RESQUE_REDIS_URL'])

Resque.redis = Redis.new(
  :host     => uri.host,
  :port     => uri.port,
  :password => uri.password
)
