class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title, :limit => 300
      t.string :description, :limit => 512
      t.string :stages, :limit => 32
      t.integer :collection_id
      t.timestamps
    end

    add_index :projects, :collection_id
  end
end
