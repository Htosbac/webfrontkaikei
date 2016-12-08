class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.integer :productcategory_id
      t.integer :producttype_id
      t.string :name
      t.decimal :price, default: 0 
      t.integer :user_id

      t.timestamps
    end
  end
end
