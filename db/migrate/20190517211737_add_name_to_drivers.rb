class AddNameToDrivers < ActiveRecord::Migration[5.2]
  def change
    add_column :drivers, :name, :string
    add_column :drivers, :last_name, :string
  end
end
