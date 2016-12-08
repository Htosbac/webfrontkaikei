class CreateInvoices < ActiveRecord::Migration[5.0]
  def change
    create_table :invoices do |t|
      t.string :customer
      t.string :checkoutday
      t.integer :stays, default: 0 
      t.integer :adults, default: 0 
      t.integer :childs, default: 0 
      t.integer :room_id
      t.decimal :roomfee, default: 0 
      t.decimal :sototal, default: 0 
      t.integer :user_id

      t.timestamps
    end
  end
end
