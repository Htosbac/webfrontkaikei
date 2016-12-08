class Productcategory < ApplicationRecord
    has_many :products
    has_many :producttypes
end
