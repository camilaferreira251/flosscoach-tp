class AddColumnProviderToUser < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string
  end
end
