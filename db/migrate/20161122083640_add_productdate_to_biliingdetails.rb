class AddProductdateToBiliingdetails < ActiveRecord::Migration[5.0]
  def change
    add_column :billingdetails, :productdate, :date
  end
end
