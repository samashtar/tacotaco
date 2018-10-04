class AddColumnToTacos < ActiveRecord::Migration[5.2]
  def change
    add_column :tacos, :img, :string
  end
end
