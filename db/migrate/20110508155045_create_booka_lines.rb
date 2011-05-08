class CreateBookaLines < ActiveRecord::Migration
  def change
    create_table :booka_lines do |t|
      t.string :title, :limit => 300
      t.string :slug, :limit => 100
      t.string :icon_path, :limit => 256
      t.string :content_type, :limit => 32
      t.belongs_to :user
      t.belongs_to :project
      t.text :body
      t.timestamps
    end

    add_index :booka_lines, :slug
  end
end
