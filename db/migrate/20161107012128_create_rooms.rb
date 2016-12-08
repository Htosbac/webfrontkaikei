class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.string :name #平日料金
      t.decimal :price1, default: 0 #平日料金
      t.decimal :price2, default: 0 #金曜日料金
      t.decimal :price3, default: 0 #土曜日料金
      t.decimal :price4, default: 0 #日曜日料金
      t.decimal :price5, default: 0 #祝日前料金
      t.decimal :price6, default: 0 #祝日料金
      t.integer :peoplenb, default: 0 #平日料金
      t.integer :roomtype_id #平日料金
      t.integer :user_id #平日料金

      t.timestamps
    end
  end
end
