class AddPictureToClient < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :picture, :string
  end
end
