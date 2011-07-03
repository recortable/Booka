class AddMoreRoomToAssetDescription < ActiveRecord::Migration
  def change
    change_column :assets, :description, :string, :limit => 1024
  end
end
