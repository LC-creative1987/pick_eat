class CreateCustomizedIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :customized_ingredients do |t|
      t.references :dish_ingredient, null: false, foreign_key: true
      t.references :order_item, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
