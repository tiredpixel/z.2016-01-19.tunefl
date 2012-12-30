CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider           => ENV['FOG_PROVIDER'],
    :rackspace_auth_url => ENV['FOG_RACKSPACE_AUTH_URL'],
    :rackspace_username => ENV['FOG_RACKSPACE_USERNAME'],
    :rackspace_api_key  => ENV['FOG_RACKSPACE_API_KEY'],
  }
  
  config.fog_directory  = ENV['FOG_DIRECTORY']
  config.asset_host     = ENV['FOG_HOST']
end

