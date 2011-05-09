class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :type, :limit => 16
      t.string :title, :limit => 100
      t.belongs_to :user
      t.belongs_to :project
      t.belongs_to :topic
      t.string :content_type, :limit => 32
      t.text :body
      t.timestamps
    end

    add_index :responses, :user_id
    add_index :responses, :project_id
    add_index :responses, :topic_id
  end
end
