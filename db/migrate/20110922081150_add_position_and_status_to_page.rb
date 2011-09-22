class AddPositionAndStatusToPage < ActiveRecord::Migration
  def change
    add_column :pages, :position, :integer
    add_column :pages, :status, :string, :limit => 10

    Project.all.each do |project|
      project.pages.order('title ASC').each_with_index do |page, index|
        page.update_attributes(position: index + 1, status: 'published')
      end
    end

  end
end
