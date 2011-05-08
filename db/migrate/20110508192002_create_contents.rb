class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :title, :limit => 300
      t.string :author, :limit => 100
      t.belongs_to :user
      t.belongs_to :project
      t.text :body
      t.string :content_type, :limit => 32
      t.timestamps
    end
  end
end
