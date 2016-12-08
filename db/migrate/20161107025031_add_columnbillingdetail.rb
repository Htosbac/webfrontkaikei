class AddColumnbillingdetail < ActiveRecord::Migration[5.0]
  def change
      add_column :billingdetails, :productdate, :string
  end
end
