class ChangeDatafuraguPricesBillingdetails < ActiveRecord::Migration[5.0]
  def change
      change_column :billingdetails, :productprice, :decimal, precision: 10, scale: 0, default:"0"
      change_column :billingdetails, :total, :decimal, precision: 10, scale: 0, default:"0"
  end
end
