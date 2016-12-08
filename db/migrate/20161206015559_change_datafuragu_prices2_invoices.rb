class ChangeDatafuraguPrices2Invoices < ActiveRecord::Migration[5.0]
  def change
      change_column :invoices, :roomfee, :decimal, precision: 10, scale: 0, default:"0"
  end
end
