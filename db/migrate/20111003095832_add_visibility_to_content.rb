class AddVisibilityToContent < ActiveRecord::Migration
  def change
    add_column :contents, :visibility, :string, :limit => 16

    Content.all.each do |content|
      content.update_attribute(:visibility, 'public')
    end
  end
end
