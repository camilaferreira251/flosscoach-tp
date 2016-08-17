class AddSendContributionToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :send_contribution, :text
  end
end
