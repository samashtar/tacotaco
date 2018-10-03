class ChangePriceToDecimal < ActiveRecord::Migration[5.2]
  def change
    change_column :ingredients, :price, :decimal
  end
end
