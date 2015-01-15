class RemoveLikeFromPhotos < ActiveRecord::Migration
  def change
    remove_column :photos, :like, :integer
  end
end
