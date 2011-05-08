class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.belongs_to :user
      t.belongs_to :project
      t.belongs_to :resource, :polymorphic => true
      t.string :ancestry
      t.timestamps
    end
    add_index :comments, :user_id
    add_index :comments, :ancestry
    add_index :comments, :resource_id
    add_index :comments, :resource_type
  end
end
