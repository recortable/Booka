class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.string :content_type, :limit => 32
      t.belongs_to :user
      t.belongs_to :project
      t.boolean :published, :default => true
      t.string :slug, :linmit => 100

      t.timestamps
    end
    add_index :posts, :user_id
    add_index :posts, :project_id
    add_index :posts, :slug
  end
end
