class Invoice < ActiveRecord::Base
    belongs_to :user
    belongs_to :room
    has_many :billingdetails, dependent: :destroy
    accepts_nested_attributes_for :billingdetails, allow_destroy: true

#    validates :customer, presence:true
#    validates :checkoutday, presence:true
#    validates :stays, presence:true
#    validates :adults, presence:true
#    validates :childs, presence:true
end
