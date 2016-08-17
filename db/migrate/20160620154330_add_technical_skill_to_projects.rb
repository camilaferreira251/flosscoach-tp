class AddTechnicalSkillToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :technical_skill, :text
  end
end
