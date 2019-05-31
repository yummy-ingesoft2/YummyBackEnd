class AddAuthTokenToCooks < ActiveRecord::Migration[5.2]
  def change
    add_column :cooks, :auth_token, :string
    add_index :cooks, :auth_token, unique: true
  end
end
