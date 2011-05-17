class CreateProjectProposals < ActiveRecord::Migration
  def change
    create_table :project_proposals do |t|
      t.references :user
      t.references :project
      t.string :rol, :limit => 32
      t.string :title, :limit => 300
      t.string :authors, :limit => 300
      t.string :description, :limit => 500
      1.upto(4) {|n| t.string "file#{n}"}
      t.text :body
      t.timestamps
    end

    add_index :project_proposals, :user_id
    add_index :project_proposals, :project_id
  end
end
