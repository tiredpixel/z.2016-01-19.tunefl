require 'carrierwave'
require 'json'


if ENV['fog_credentials']
  CarrierWave.configure do |config|
    config.fog_credentials = JSON.parse(ENV['fog_credentials']).with_indifferent_access
    
    config.fog_directory = ENV['fog_directory']
    
    config.asset_host = ENV['asset_host']
  end
end
