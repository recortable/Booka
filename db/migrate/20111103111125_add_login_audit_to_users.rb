class AddLoginAuditToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_login_at, :datetime
    add_column :users, :login_count, :integer, default: 0
  end
end
