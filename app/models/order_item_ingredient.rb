class OrderItemIngredient < ApplicationRecord
  belongs_to :order_item
  belongs_to :ingredient

  validates :order_item, :ingredient, :kind, presence: true
  validates :kind, inclusion: { in: %w(extras omited) }
end
