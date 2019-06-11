class AddPictureToDriver < ActiveRecord::Migration[5.2]
  def change
    add_column :drivers, :picture, :string
  end
end
