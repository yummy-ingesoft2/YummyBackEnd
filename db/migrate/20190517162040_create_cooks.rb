class CreateCooks < ActiveRecord::Migration[5.2]
  def change
    create_table :cooks do |t|
      t.string :name
      t.string :last_name
      t.string :gender
      t.date :birthdate
      t.string :email
      t.string :latitude
      t.string :longitude
      t.string :address
      t.string :user
      t.string :password

      t.timestamps
    end
  end
end
