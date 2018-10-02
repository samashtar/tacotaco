class Taco < ApplicationRecord
  has_many :taco_ingredients
  has_many :user_tacos
  has_many :ingredients, through: :taco_ingredients
  has_many :users, through: :user_tacos

  def compact
   delete_if { |k, v| v.nil? }
 end


   def taco_price
     total = 0
  self.ingredients.each do |ingredient|
   total += ingredient.price
  end
total
end



end
