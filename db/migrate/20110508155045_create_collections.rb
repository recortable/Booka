class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.string :title, :limit => 100
      t.string :icon_path, :limit => 256
      t.string :content_type, :limit => 32
      t.text :body
      t.timestamps
    end
  end
end
