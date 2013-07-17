class Product < ActiveRecord::Base
  has_many :orders

  validates_numericality_of :price

end
