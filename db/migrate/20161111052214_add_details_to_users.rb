class AddDetailsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :phonetic, :string
    add_column :users, :pstalcode, :string
    add_column :users, :address, :string
    add_column :users, :tel, :string
    add_column :users, :fax, :string
  end
end
