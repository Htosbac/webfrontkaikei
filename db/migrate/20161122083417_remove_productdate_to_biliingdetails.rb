class RemoveProductdateToBiliingdetails < ActiveRecord::Migration[5.0]
  def up
    remove_column :billingdetails, :productdate
  end
  def down
    remove_column :billingdetails, :productdate, :string
  end
end
