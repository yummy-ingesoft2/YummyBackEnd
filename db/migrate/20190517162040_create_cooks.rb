class CreateCooks < ActiveRecord::Migration[5.2]
  def change
    create_table :cooks do |t|
      t.string :name
      t.string :last_name
      t.boolean :state
      t.string :gender
      t.date :birthdate
      t.integer :tel
      t.string :email
      t.string :latitude
      t.string :longitude
      t.string :address
      t.string :user
      t.string :password_digest
      t.belongs_to :city, index: true

      t.timestamps
    end
  end
end
