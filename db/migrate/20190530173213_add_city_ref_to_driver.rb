class AddCityRefToDriver < ActiveRecord::Migration[5.2]
  def change
    add_reference :drivers, :city, foreign_key: true
  end
end
