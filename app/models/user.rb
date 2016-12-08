class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :validatable

  has_many :products
  has_many :rooms
  has_many :invoices
  has_many :billingdetails

  validates :name, presence:true
  validates :email, presence:true, uniqueness:true

end
