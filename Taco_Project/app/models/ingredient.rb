class Ingredient < ApplicationRecord
  belongs_to :category
  has_many :taco_ingredients
  has_many :tacos, through: :taco_ingredients
end
