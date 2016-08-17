class AddSearchResourceToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :search_resource, :text
  end
end
