class CreateDrivers < ActiveRecord::Migration[5.2]
  def change
    create_table :drivers do |t|
      t.string :user
      t.string :password
      t.string :email

      t.timestamps
    end
  end
end
