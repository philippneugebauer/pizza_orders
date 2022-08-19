class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :pizza
  belongs_to :pizza_size

  has_many :order_item_ingredients
  has_many :extras, -> { where(kind: "extras") }, class_name: 'OrderItemIngredient'
  has_many :omited, -> { where(kind: "omited") }, class_name: 'OrderItemIngredient'
end
