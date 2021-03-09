class RenameIncrementToChangeIncrement < ActiveRecord::Migration[6.1]
  def change
    rename_column :ingredients, :increment, :change_increment
  end
end
