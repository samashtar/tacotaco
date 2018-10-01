class CreateCoupons < ActiveRecord::Migration[5.2]
  def change
    create_table :coupons do |t|
      t.string :name
      t.integer :point_cost
      t.string :type
      t.string :description
      t.timestamps
    end
  end
end
