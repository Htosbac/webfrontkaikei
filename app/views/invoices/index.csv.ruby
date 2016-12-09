require "csv"
require "nkf"

csv_data = CSV.generate(force_quotes: true) do |csv|

  csv << %w(請求書ID お客様名 ﾁｪｯｸｱｳﾄ日 泊数 大人 小人 部屋名 総合計 日付 商品id 商品種類 中分類 個数 単価 合計)
  
  @invoices.each do |item|
    @billingdetails.where(invoice_id: item.id).each do |b|
    row = []
    row << item.id
    row << item.try(:customer)
    row << item.try(:checkoutday)
    row << item.try(:stays)
    row << item.try(:adults)
    row << item.try(:childs)
    row << item.try(:room_id)
    row << item.try(:sototal)
    row << b.try(:productdate)
    row << b.try(:product_id)
    row << b.try(:productcategory_id)
    row << b.try(:producttype_id)
    row << b.try(:productnb)
    row << b.try(:productprice)
    row << b.try(:total)
    csv << row
    end
  end
end

NKF::nkf('--sjis -Lw', csv_data)