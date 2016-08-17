class AddDocumentationToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :documentation, :text
  end
end
