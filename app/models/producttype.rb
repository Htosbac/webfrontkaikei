class Producttype < ApplicationRecord
    belongs_to :productcategory
    has_many :products
end
