class RenameTypeFromOrderPromotion < ActiveRecord::Migration[7.0]
  def change
    rename_column :order_item_ingredients, :type, :kind
  end
end
