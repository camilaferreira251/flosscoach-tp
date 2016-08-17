class AddContributionToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :contribution, :text
  end
end
