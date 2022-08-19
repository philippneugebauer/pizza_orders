class CreateOrderPromotions < ActiveRecord::Migration[7.0]
  def change
    create_table :order_promotions do |t|
      t.references :order, null: false, foreign_key: true
      t.references :promotion, null: false, foreign_key: true

      t.timestamps
    end
  end
end
