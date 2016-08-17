class AddWorkspaceSetupToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :workspace_setup, :text
  end
end
