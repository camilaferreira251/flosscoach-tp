class AddOperationalSystemIdToProject < ActiveRecord::Migration
  def change
    add_column :projects, :operational_system_id, :integer
    add_index  :projects, :operational_system_id
  end
end
