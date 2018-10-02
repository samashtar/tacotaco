class User < ApplicationRecord
  belongs_to :location
  has_many :user_tacos
  has_many :tacos, through: :user_tacos
  has_secure_password

  # def password=(new_password)
  #   salt = BCrypt::Engine::generate_salt
  #   hashed = BCrypt::Engine::hash_secret(new_password, salt)
  #   self.password_digest = salt + hashed
  # end
  #
  # def authenticate(password)
  #   salt = password_digest[0..28]
  #   hashed = BCrypt::Engine::hash_secret(password, salt)
  #   return nil unless (salt + hashed) == self.password_digest
  # end


    def total
      total = 0
  self.tacos.each do |taco|
      taco.ingredients.each do |ingredient|
        total += ingredient.price
    end
    end
    total
    end



end
