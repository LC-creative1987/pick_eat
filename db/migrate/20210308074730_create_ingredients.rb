class CreateIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :unit
      t.integer :increment
      t.integer :cost
      t.integer :price
      t.references :restaurant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
