class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.decimal :price
      t.string :promotion_codes, array: true
      t.text :state
      t.text :discount_code

      t.timestamps
    end
  end
end
