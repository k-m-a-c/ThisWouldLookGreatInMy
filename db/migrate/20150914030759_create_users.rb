class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.integer :uid
      t.string :email
      t.string :name
      t.string :image
      t.string :token
      t.string :token_secret

      t.timestamps null: false
    end
  end
end
