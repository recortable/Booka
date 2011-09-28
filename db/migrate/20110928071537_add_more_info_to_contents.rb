class AddMoreInfoToContents < ActiveRecord::Migration
  def change
    add_column :contents, :summary, :string, :limit => 1024
    add_column :contents, :category, :string, :limit => 32
    add_column :contents, :notes, :text
    add_column :contents, :render_mode, :string, :limit => 16
  end
end
