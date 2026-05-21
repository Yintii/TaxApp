class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :wallets, dependent: :destroy
  
  validates :first_name, :last_name, presence: true
  #validates :phone_number, presence: true, format: { with: /\A[\+]?[\d\s\-\(\)]{10,}\z/, message: "must be a valid phone number" }
  validates :address_1, :city, :state, :zip_code, presence: true

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  def full_name
    "#{first_name} #{last_name}"
  end
end
