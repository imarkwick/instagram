class RemoveLikesFromPhotos < ActiveRecord::Migration
  def change
    remove_column :photos, :likes, :integer
  end
end
