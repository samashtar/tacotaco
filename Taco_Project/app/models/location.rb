class Location < ApplicationRecord
  has_many :users
  validates :name, presence: true

  validates :email, presence: true
  validates :address, presence: true
  validates :email, format: {with: /@/}
  validates :phone_number, numericality: {only_integer: true}
  validates :phone_number, length: {minimum: 10}
  
end
