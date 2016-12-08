class CreateBillingdetails < ActiveRecord::Migration[5.0]
  def change
    create_table :billingdetails do |t|
      t.string :invoice_id
      t.integer :product_id
      t.integer :productcategory_id
      t.integer :producttype_id
      t.string :productname
      t.decimal :productprice, default: 0 
      t.integer :productnb, default: 0 
      t.decimal :total, default: 0 

      t.timestamps
    end
  end
end
