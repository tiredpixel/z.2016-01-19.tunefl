class MidiUploader < CarrierWave::Uploader::Base
  
  storage (ENV['FOG_PROVIDER'].blank? ? :file : :fog)
  
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  
  def extension_white_list
    %w(midi mid)
  end
  
end

