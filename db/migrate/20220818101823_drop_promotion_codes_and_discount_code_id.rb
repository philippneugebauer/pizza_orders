class DropPromotionCodesAndDiscountCodeId < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :discount_code_id
    remove_column :orders, :promotion_codes
    add_reference :orders, :discount, index: true
  end
end
