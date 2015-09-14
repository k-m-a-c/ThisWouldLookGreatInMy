class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :photo_uid, null: false
      t.timestamps null: false
    end
  end
end
