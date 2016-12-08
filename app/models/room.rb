class Room < ApplicationRecord
    belongs_to :user
    belongs_to :roomtype
    
    validates :name, presence:true
    validates :price1, presence:true
    validates :price2, presence:true
    validates :price3, presence:true
    validates :price4, presence:true
    validates :price5, presence:true
    validates :price6, presence:true
    validates :peoplenb, presence:true
#    validates :roomtype_id, presence:true
    
  def view_name_and_id
    self.price1.to_s + '(' + self.name + ')'
  end

end
