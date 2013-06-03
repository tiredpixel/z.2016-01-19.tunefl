Tunefl::Application.configure do
  config.gem 'rack-google-analytics',
    :lib => 'rack/google-analytics'
  
  config.middleware.use Rack::GoogleAnalytics,
    :tracker => (ENV['GOOGLE_ANALYTICS_TRACKER'] || "UA-00000000-1")
end

