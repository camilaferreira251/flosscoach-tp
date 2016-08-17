class AddLanguageIdToProject < ActiveRecord::Migration
  def change
    add_column :projects, :language_id, :integer
    add_index  :projects, :language_id
  end
end
