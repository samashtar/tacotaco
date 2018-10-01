class CreateUserTacos < ActiveRecord::Migration[5.2]
  def change
    create_table :user_tacos do |t|
      t.integer :user_id
      t.integer :taco_id
      t.timestamps
    end
  end
end
