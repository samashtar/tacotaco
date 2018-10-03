class User < ApplicationRecord
  belongs_to :location
  has_many :user_tacos
  has_many :tacos, through: :user_tacos
  has_secure_password

  def total
    total = 0
    active_tacos.each do |taco|
      total += 1
      taco.ingredients.each do |ingredient|
        total += ingredient.price
      end
    end
    total
  end

  def active_tacos
    tacos.select{|taco| taco.order_status == true}
  end

  def deactivate_tacos
    active_tacos.map do |taco|
      taco.order_status = false
      taco.save
      self.taco_points += 1
    end
  end

  def location_name
    location.name
  end

  def favorite_(category)
    array = tacos.map{|taco| taco.item_name(category)}
    array.delete_if(&:blank?).max_by{|ingredient| array.count(ingredient)}
  end

end
