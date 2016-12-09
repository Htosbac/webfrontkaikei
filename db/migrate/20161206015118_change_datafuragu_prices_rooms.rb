class ChangeDatafuraguPricesRooms < ActiveRecord::Migration[5.0]
  def change
      change_column :rooms, :price1, :decimal, precision: 10, scale: 0, default:"0"
      change_column :rooms, :price2, :decimal, precision: 10, scale: 0, default:"0"
      change_column :rooms, :price3, :decimal, precision: 10, scale: 0, default:"0"
      change_column :rooms, :price4, :decimal, precision: 10, scale: 0, default:"0"
      change_column :rooms, :price5, :decimal, precision: 10, scale: 0, default:"0"
      change_column :rooms, :price6, :decimal, precision: 10, scale: 0, default:"0"
  end
end
