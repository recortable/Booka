class Asset < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  belongs_to :resource, :polymorphic => true

  mount_uploader :file, AssetUploader

  validates :project_id, :presence => true
  validates :user_id, :presence => true
  validates :title, :presence => true
end
# == Schema Information
#
# Table name: assets
#
#  id            :integer(4)      not null, primary key
#  title         :string(100)
#  description   :string(1024)
#  user_id       :integer(4)
#  project_id    :integer(4)
#  resource_id   :integer(4)
#  resource_type :string(255)
#  file          :string(255)
#  url_file      :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

