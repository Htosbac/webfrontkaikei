class RemoveProductnameFromBillingdetails < ActiveRecord::Migration[5.0]
  def up
    remove_column :billingdetails, :productname
  end
  def down
    remove_column :billingdetails, :productname, :string
  end
end
