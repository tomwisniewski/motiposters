class Order < ActiveRecord::Base
  belongs_to :product

  before_save { self.email = email.downcase } #callback to downcase email in order to verify uniquenes on top of validation
  validates :name, presence: true, length: { maximum: 50 }
  validates :street, presence: true
  validates :city, presence: true
  validates :postcode, presence: true, length: { maximum: 8 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: {case_sensitive: false}


end
