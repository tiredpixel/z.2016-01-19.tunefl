require 'json'

if ENV['FOG_CREDENTIALS']
  CarrierWave.configure do |config|
    config.fog_credentials = JSON.parse(ENV['FOG_CREDENTIALS']).with_indifferent_access
    
    config.fog_directory = ENV['FOG_DIRECTORY']
    
    config.asset_host = ENV['ASSET_HOST']
  end
end
