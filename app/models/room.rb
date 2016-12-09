class Room < ApplicationRecord
    belongs_to :user
    belongs_to :roomtype
    
    validate :add_error_sample
    def add_error_sample
        if name.blank?
            errors[:base] << "部屋名を入力して下さい"
        end
        
        if peoplenb.blank?
            errors[:base] << "宿泊可能人数を入力して下さい"
        end
        
        if roomtype_id.blank?
            errors[:base] << "部屋タイプを選択して下さい"
        end
    end

end
