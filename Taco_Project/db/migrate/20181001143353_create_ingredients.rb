class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.integer :price
      t.integer :calories
      t.integer :category_id
      t.timestamps
    end
  end
end
