class AddPictureToCook < ActiveRecord::Migration[5.2]
  def change
    add_column :cooks, :picture, :string
  end
end
