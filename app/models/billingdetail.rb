class Billingdetail < ActiveRecord::Base
    belongs_to :user
    belongs_to :producttype
    belongs_to :product

end
