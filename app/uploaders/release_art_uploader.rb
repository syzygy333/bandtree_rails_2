# encoding: utf-8

class ReleaseArtUploader < CarrierWave::Uploader::Base
  storage :file

  def default_url(*args)
    "placeholder-release"
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end
