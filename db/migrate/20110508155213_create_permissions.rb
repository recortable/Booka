class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.belongs_to :user
      t.belongs_to :project
      t.string :level, :limit => 16

      t.timestamps
    end
    add_index :permissions, :user_id
    add_index :permissions, :project_id
  end
end
