class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :picture
      t.string :comment
      t.integer :likes

      t.timestamps
    end
  end
end
