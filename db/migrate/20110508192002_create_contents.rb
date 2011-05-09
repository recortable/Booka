class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :title, :limit => 300
      t.string :author, :limit => 100
      t.integer :position
      t.belongs_to :user
      t.belongs_to :project
      t.text :body
      t.string :content_type, :limit => 32
      t.timestamps
    end

    add_index :contents, :project_id
    add_index :contents, :user_id
  end
end
