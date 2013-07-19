class Product < ActiveRecord::Base
  has_many :orders

  # validates_numericality_of :price

  attr_accessible :avatar, :title, :price
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/missing.png"
end
