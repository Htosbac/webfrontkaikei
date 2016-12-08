class AddDummyToBillingdetails < ActiveRecord::Migration[5.0]
  def change
    add_column :billingdetails, :dummy, :integer
  end
end
