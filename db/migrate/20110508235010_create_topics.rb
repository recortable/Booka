class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title, :limit => 300
      t.belongs_to :user
      t.belongs_to :project
      t.text :body
      t.string :content_type, :limit => 32
      t.timestamps
    end

    add_index :topics, :project_id
    add_index :topics, :user_id
  end
end
