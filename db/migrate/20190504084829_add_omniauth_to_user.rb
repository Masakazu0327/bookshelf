class AddOmniauthToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :provider, :string
    add_column :users, :provider_token, :string
    add_column :users, :provider_uid, :string
  end
end
