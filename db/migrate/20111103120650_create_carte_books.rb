class CreateCarteBooks < ActiveRecord::Migration
  def change
    create_table :carte_books do |t|
      t.belongs_to :user
      t.string :title, limit: 300
      t.string :subtitle, limit: 500
      t.string :editor, limit: 300
      t.string :place, limit: 200
      t.date :pub_date
      t.text :contents
      t.timestamps
    end
  end
end
