class CreateOrderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items do |t|
      t.text :name
      t.text :size
      t.string :extras, array: true
      t.string :omited, array: true
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
