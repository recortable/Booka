class CreateVersions < ActiveRecord::Migration
  def self.up
    create_table :versions do |t|
      t.string   :item_type, :null => false
      t.integer  :item_id,   :null => false
      t.string   :event,     :null => false
      t.string   :whodunnit
      t.text     :object
      t.datetime :created_at
      t.integer :project_id
      t.integer :user_id
      t.string :title, :limit => 300
      t.string :sub_type, :limit => 64
      t.boolean :notified, :default => false
    end
    add_index :versions, [:item_type, :item_id]
    add_index :versions, :project_id
  end

  def self.down
    remove_index :versions, [:item_type, :item_id]
    drop_table :versions
  end
end
