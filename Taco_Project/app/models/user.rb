class User < ApplicationRecord
  belongs_to :location
  # has_many :user_tacos
  # has_many :tacos, through: :user_tacos
end
