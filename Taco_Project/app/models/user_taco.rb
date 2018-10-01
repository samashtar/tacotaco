class UserTaco < ApplicationRecord
  belongs_to :taco
  belongs_to :user 
end
