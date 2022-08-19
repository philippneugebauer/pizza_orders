class CreateOrderItemIngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :order_item_ingredients do |t|
      t.references :order_item, null: false, foreign_key: true
      t.references :ingredient, null: false, foreign_key: true
      t.string :type

      t.timestamps
    end
  end
end
