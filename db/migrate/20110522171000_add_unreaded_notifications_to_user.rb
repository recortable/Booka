class AddUnreadedNotificationsToUser < ActiveRecord::Migration
  def change
    add_column :users, :unreaded_notifications_count, :integer, :default => 0
  end
end
