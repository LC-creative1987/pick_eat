class ChangeColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :orders, :delivery_adress, :delivery_address
  end
end
