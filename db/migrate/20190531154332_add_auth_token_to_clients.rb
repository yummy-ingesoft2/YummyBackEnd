class AddAuthTokenToClients < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :auth_token, :string
    add_index :clients, :auth_token, unique: true
  end
end
