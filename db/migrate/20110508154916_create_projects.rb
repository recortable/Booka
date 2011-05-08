class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title, :limit => 300
      t.string :slug, :limit => 100
      t.text :body
      t.string :content_type, :limit => 32
      t.string :stages, :limit => 32
      t.belongs_to :booka_line
      t.belongs_to :user
      t.timestamps
    end

    add_index :projects, :user_id
    add_index :projects, :booka_line_id
  end
end
