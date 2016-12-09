class ChangeDatafuraguPricesInvoices < ActiveRecord::Migration[5.0]
  def change
      change_column :invoices, :sototal, :decimal, precision: 10, scale: 0, default:"0"
  end
end
