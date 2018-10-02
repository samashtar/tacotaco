class Ingredient < ApplicationRecord
  belongs_to :category
  has_many :taco_ingredients
  has_many :tacos, through: :taco_ingredients

  def category_name
    category.name
  end
  def self.category(name)
    select{|ingredient| ingredient.category_name == name}
  end






end
