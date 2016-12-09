class Invoice < ActiveRecord::Base
    belongs_to :user
    belongs_to :room
    has_many :billingdetails, dependent: :destroy
    accepts_nested_attributes_for :billingdetails, allow_destroy: true

    validate :add_error_sample
    def add_error_sample
        if customer.blank?
            errors[:base] << "お客様名を入力して下さい"
        end
        
        if checkoutday.blank?
            errors[:base] << "チェックアウト日を入力して下さい"
        end
        
        if stays.blank?
            errors[:base] << "宿泊数を入力して下さい"
        end
        
        if adults.blank?
            errors[:base] << "大人の人数を入力して下さい"
        end
        
        if childs.blank?
            errors[:base] << "子供の人数を入力して下さい"
        end
        
        if room_id.blank?
            errors[:base] << "部屋をを選択して下さい"
        end
    end
end
