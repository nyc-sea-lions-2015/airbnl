class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, null:false
      t.string :last_name, null:false
      t.integer :age
      t.string :photo_url
      t.string :email, null:false
      t.string :password_digest, null:false
      t.string :language, null:false
      t.text :description
      t.string :facebook_url

      t.timestamps
    end
  end
end
