class ChangeQuantityForBaseQuantity < ActiveRecord::Migration[6.1]
  def change
    rename_column :special_requests, :base_quantity, :quantity
    remove_column :special_requests, :min_quantity
    remove_column :special_requests, :max_quantity
  end
end
