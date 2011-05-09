class Asset < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  belongs_to :resource, :polymorphic => true

  mount_uploader :file, AssetUploader

  validates :project_id, :presence => true
  validates :user_id, :presence => true
  validates :title, :presence => true
end
