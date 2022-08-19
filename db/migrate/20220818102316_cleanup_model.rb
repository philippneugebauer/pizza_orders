class CleanupModel < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :discount_id
    add_reference :orders, :discount, foreign_key: true

    remove_column :order_items, :name
    remove_column :order_items, :size
    add_reference :order_items, :pizza, foreign_key: true
    add_reference :order_items, :pizza_size, foreign_key: true
  end
end
