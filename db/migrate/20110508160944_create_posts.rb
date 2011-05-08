class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.string :content_type
      t.belongs_to :user
      t.belongs_to :project
      t.boolean :published
      t.string :slug

      t.timestamps
    end
    add_index :posts, :user_id
    add_index :posts, :project_id
  end
end
