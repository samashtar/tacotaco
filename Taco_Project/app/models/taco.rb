class Taco < ApplicationRecord

  has_many :taco_ingredients
  has_many :user_tacos
  has_many :ingredients, through: :taco_ingredients
  has_many :users, through: :user_tacos

  # CLASS METHODS

  def self.most_popular(category)
    array = all.map{|taco| taco.item_name(category)}
    array.delete_if(&:blank?).max_by{|ingredient| array.count(ingredient)}
  end

  def self.average_calories
    all.map{|taco| taco.calories}.delete_if(&:blank?).reduce(:+) / all.length.to_f
  end

  # INSTANCE METHODS

  def calories
    self.ingredients.map{|i| i.calories}.reduce(:+) || 0
  end

  def generate_name
    string = ""
    if self.has?("sauce")
      string = string + "#{item_name("sauces")} "
    end

    if self.has?("protein")
      string = string + "#{item_name("protein")} "
    end

    string = string + "Taco"

    if self.has?("topping")
      string = string + " with #{item_name("toppings")}"
    end
    string
  end

  def has?(category)
    !ingredients.select{|ingredient| ingredient.category_name == category}.empty?
  end

  def taco_price
    total = 1
      self.ingredients.each do |ingredient|
        total += ingredient.price
      end
    total
  end

  # CUSTOM SETTER AND GETTER METHODS

  def protein
    self.ingredients.select do |ingredient|
      ingredient.category_name == "protein"
    end
  end

  def protein=(id)
    self.ingredients << Ingredient.find(id)
  end

  def bean
    self.ingredients.select do |ingredient|
      ingredient.category_name == "bean"
    end
  end

  def bean=(id)
    self.ingredients << Ingredient.find(id)
  end

  def tortilla
    self.ingredients.select do |ingredient|
      ingredient.category_name == "tortilla"
    end
  end

  def tortilla=(id)
    self.ingredients << Ingredient.find(id)
  end

  def rice
    self.ingredients.select do |ingredient|
      ingredient.category_name == "rice"
    end
  end

  def rice=(id)
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
      ingredient.category_name == "topping"
    end
  end

  def toppings=(array_of_ids)
    array_of_ids.reject(&:blank?).each do |id|
      self.ingredients << Ingredient.find(id)
    end
  end

  def item_name(ingredient_type)
    if !self.send(ingredient_type.to_sym)[0].nil?
      self.send(ingredient_type.to_sym)[0].name.capitalize
    else
      ""
    end
  end

end
