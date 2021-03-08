class CreateDishIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :dish_ingredients do |t|
      t.integer :base_quantity
      t.integer :min_quantity
      t.integer :max_quantity
      t.references :dish, null: false, foreign_key: true
      t.references :ingredient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
