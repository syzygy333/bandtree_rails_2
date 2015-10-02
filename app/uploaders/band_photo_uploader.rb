# encoding: utf-8

class BandPhotoUploader < CarrierWave::Uploader::Base
  storage :file

  def default_url(*args)
    "placeholder-band"
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end
