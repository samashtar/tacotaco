class AddDescriptionToTacos < ActiveRecord::Migration[5.2]
  def change
    add_column :tacos, :description, :text
    add_column :tacos, :signature, :boolean, default: false
  end
end
