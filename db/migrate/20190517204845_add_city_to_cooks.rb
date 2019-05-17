class AddCityToCooks < ActiveRecord::Migration[5.2]
  def change
    add_reference :cooks, :city, foreign_key: true
  end
end
