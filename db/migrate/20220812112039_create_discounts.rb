class CreateDiscounts < ActiveRecord::Migration[7.0]
  def change
    create_table :discounts do |t|
      t.string :code
      t.decimal :percentage

      t.timestamps
    end
  end
end
