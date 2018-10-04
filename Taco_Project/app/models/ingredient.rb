class Ingredient < ApplicationRecord
  belongs_to :category
  has_many :taco_ingredients
  has_many :tacos, through: :taco_ingredients
  validates :name, presence: true

  # CLASS METHODS

  def self.category(name)
    select{|ingredient| ingredient.category_name == name}
  end

  def self.extra_cost
    select{|ingredient| ingredient.price > 0}
  end

  # INSTANCE METHODS

  def category_name
    category.name
  end

  def price_string
    price.to_s.gsub('0', '')
  end

end
