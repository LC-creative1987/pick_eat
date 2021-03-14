class CreateSpecialRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :special_requests do |t|
      t.integer :base_quantity
      t.integer :min_quantity
      t.integer :max_quantity
      t.references :ingredient, null: false, foreign_key: true
      t.references :order_item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
