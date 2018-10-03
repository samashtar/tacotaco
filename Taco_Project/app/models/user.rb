class User < ApplicationRecord
  belongs_to :location
  has_many :user_tacos
  has_many :tacos, through: :user_tacos
  has_secure_password

  def total
    total = 0
    self.active_tacos.each do |taco|
      taco.ingredients.each do |ingredient|
        total += ingredient.price
      end
    end
    total
  end

  def active_tacos
    self.tacos.select{|taco| taco.order_status == true}
  end

  def deactivate_tacos
    self.active_tacos.map do |taco|
      taco.order_status = false
      taco.save
    end
  end

end
