class AddSoftSkillToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :soft_skill, :text
  end
end
