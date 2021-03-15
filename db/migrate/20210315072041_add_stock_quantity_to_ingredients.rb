class AddStockQuantityToIngredients < ActiveRecord::Migration[6.1]
  def change
    add_column :ingredients, :stock_quantity, :integer
  end
end
