class AddInvoicenamesToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :invoicename1, :string
    add_column :users, :invoicename2, :string
  end
end
