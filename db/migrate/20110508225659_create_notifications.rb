class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.belongs_to :user
      t.belongs_to :version
      t.belongs_to :project
      t.boolean :should_be_emailed

      t.datetime :event_at
    end
    add_index :notifications, :user_id
    add_index :notifications, :project_id
  end
end
