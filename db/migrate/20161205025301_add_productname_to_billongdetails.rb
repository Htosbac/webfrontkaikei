class AddProductnameToBillongdetails < ActiveRecord::Migration[5.0]
  def change
    add_column :billingdetails, :productname, :string
  end
end
