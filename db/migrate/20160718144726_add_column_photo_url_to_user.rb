class AddColumnPhotoUrlToUser < ActiveRecord::Migration
  def change
    add_column :users, :photo_url, :string
  end
end
