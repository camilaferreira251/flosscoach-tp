class CreateOperationalSystems < ActiveRecord::Migration
  def change
    create_table :operational_systems do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
