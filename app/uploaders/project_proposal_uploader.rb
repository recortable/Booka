# encoding: utf-8

class ProjectProposalUploader < CarrierWave::Uploader::Base
  storage :s3

  def store_dir
    "project_proposal/#{model.id}/#{mounted_as}"
  end

  def cache_dir
    "#{Rails.root}/tmp/uploads"
  end
end
