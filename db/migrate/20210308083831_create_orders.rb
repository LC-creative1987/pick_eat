class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.datetime :date
      t.text :delivery_adress
      t.integer :eta
      t.integer :total_price
      t.string :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
