class AddInvoiceIdToBillingdetails < ActiveRecord::Migration[5.0]
  def change
    add_column :billingdetails, :invoice_id, :integer
  end
end
