class Product < ApplicationRecord
    belongs_to :user
    belongs_to :productcategory
    belongs_to :producttype

    validate :add_error_sample
    def add_error_sample
        if name.blank?
            errors[:base] << "商品名を入力して下さい"
        end
        
        if productcategory_id.blank?
            errors[:base] << "商品種類を選択して下さい"
        end
        
        if producttype_id.blank?
            errors[:base] << "中分類を選択して下さい"
        end
        
        if price.blank?
            errors[:base] << "単価を入力して下さい"
        end
    end
end
