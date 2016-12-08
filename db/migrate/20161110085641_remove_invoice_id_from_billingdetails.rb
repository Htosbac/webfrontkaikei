class RemoveInvoiceIdFromBillingdetails < ActiveRecord::Migration[5.0]
  def up
    remove_column :billingdetails, :invoice_id
  end
  def down
    remove_column :billingdetails, :invoice_id, :string
  end
end
