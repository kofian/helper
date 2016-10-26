class RenameImageToPictureInUsers < ActiveRecord::Migration
  def change
   rename_column(:users, :image, :picture)
  end
end
