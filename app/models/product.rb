class Product < ApplicationRecord
    belongs_to :user
    belongs_to :productcategory
    belongs_to :producttype

    validates :name, presence:true
#    validates :productcategory_id, presence:true
#    validates :producttype_id, presence:true
    validates :price, presence:true
end
