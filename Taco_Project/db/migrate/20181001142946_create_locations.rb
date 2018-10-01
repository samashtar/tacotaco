class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :address
      t.integer :phone_number
      t.string :email
      t.datetime :opening_time
      t.datetime :closing_time
      t.timestamps
    end
  end
end
