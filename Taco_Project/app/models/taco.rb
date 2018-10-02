class Taco < ApplicationRecord


  has_many :taco_ingredients
  has_many :user_tacos
  has_many :ingredients, through: :taco_ingredients
  has_many :users, through: :user_tacos

  def taco_price
    total = 0
      self.ingredients.each do |ingredient|
        total += ingredient.price
      end
    total
  end

  # CUSTOM SETTER AND GETTER METHODS

  def protein
    self.ingredients.select do |ingredient|
      ingredient.category.name == "protein"
    end
  end

  def protein=(id)
    self.ingredients << Ingredient.find(id)
  end

  def bean
    self.ingredients.select do |ingredient|
      ingredient.category.name == "bean"
    end
  end

  def bean=(id)
    self.ingredients << Ingredient.find(id)
  end

  def tortilla
    self.ingredients.select do |ingredient|
      ingredient.category.name == "tortilla"
    end
  end

  def tortilla=(id)
    self.ingredients << Ingredient.find(id)
  end

  def sauces
    self.ingredients.select do |ingredient|
      ingredient.category.name == "sauce"
    end
  end

  def sauces=(array_of_ids)
    array_of_ids.reject(&:blank?).each do |id|
      self.ingredients << Ingredient.find(id)
    end
  end

  def toppings
    self.ingredients.select do |ingredient|
      ingredient.category.name == "topping"
    end
  end

  def toppings=(array_of_ids)
    array_of_ids.reject(&:blank?).each do |id|
      self.ingredients << Ingredient.find(id)
    end
  end

end
