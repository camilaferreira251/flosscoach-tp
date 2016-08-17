class AddResourceToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :resource, :text
  end
end
