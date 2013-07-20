class Product < ActiveRecord::Base
  has_many :orders

  validates_numericality_of :price
  validates :avatar, :attachment_presence => true

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/missing.png"
end
