class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title, :limit => 300
      t.belongs_to :user
      t.belongs_to :project
      t.text :body
      t.string :content_type, :limit => 32
      t.timestamps
    end

    add_index :pages, :user_id
    add_index :pages, :project_id
  end
end
