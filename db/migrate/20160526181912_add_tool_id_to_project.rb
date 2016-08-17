class AddToolIdToProject < ActiveRecord::Migration
  def change
    add_column :projects, :tool_id, :integer
    add_index  :projects, :tool_id
  end
end
