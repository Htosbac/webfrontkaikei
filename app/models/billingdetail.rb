class Billingdetail < ActiveRecord::Base
    belongs_to :user
    belongs_to :producttype
#    belongs_to :invoice
#    has_one :user, through: :invoice


#    validates :productdate, presence:true
#    validates :productname, presence:true
#    validates :productnb, presence:true
#    validates :total, presence:true

end
