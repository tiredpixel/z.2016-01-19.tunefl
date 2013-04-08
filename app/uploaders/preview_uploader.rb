class PreviewUploader < CarrierWave::Uploader::Base
  
  storage (ENV['FOG_CREDENTIALS'] ? :fog : :file)
  
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  
  def extension_white_list
    %w(png)
  end
  
end
