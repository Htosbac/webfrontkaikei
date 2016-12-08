class AddUserIdTobillingdetails < ActiveRecord::Migration[5.0]
  def change
      add_column :billingdetails, :user_id, :integer
  end
end
