class CreateProducttypes < ActiveRecord::Migration[5.0]
  def change
    create_table :producttypes do |t|
      t.integer :productcategory_id
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  end
end
