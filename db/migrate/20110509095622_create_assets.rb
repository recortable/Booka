class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :title, :limit => 100
      t.string :description, :limit => 300
      t.belongs_to :user
      t.belongs_to :project
      t.belongs_to :resource, :polymorphic => true
      t.string :file
      t.string :url_file
      t.timestamps
    end

    add_index :assets, :project_id
    add_index :assets, :user_id
    add_index :assets, :resource_id
    add_index :assets, :resource_type
  end
end
