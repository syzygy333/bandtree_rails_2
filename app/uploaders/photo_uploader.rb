# encoding: utf-8

class PhotoUploader < CarrierWave::Uploader::Base
  storage :file

  def default_url(*args)
    "<%= fa_icon user %>"
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end
