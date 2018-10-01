class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :password
      t.string :email
      t.string :address
      t.integer :phone_number
      t.integer :location_id
      t.integer :taco_points
      t.timestamps
    end
  end
end
