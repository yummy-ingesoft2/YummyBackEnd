class AddPhotosToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :photos, :string
  end
end
