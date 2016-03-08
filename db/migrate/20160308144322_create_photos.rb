class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :name
      t.string :specialty
      t.references :user
      t.string :photo

      t.timestamps null: false
    end
  end
end
