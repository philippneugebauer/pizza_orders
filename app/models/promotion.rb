class Promotion < ApplicationRecord
  has_many :order_promotions
  has_many :orders, through: :order_promotions

  belongs_to :pizza_size
  belongs_to :pizza

  validates :code, :pizza, :pizza_size, presence: true
  validates :from, numericality: { only_integer: true, greater_than: 0 }
  validates :to, numericality: { only_integer: true, greater_than_or_equal: 0 }
  validates :code, uniqueness: true

  def compute_promotion(order_items)
    affected_order_items = order_items.select do |oi|
      oi.pizza_id == pizza_id && oi.pizza_size_id == pizza_size_id
    end

    { affected_order_items:, promotion_item_costs: compute_promotion_item_costs(affected_order_items) }
  end

  def compute_promotion_item_costs(affected_order_items)
    costs_of_extras_in_promotion_items = affected_order_items.sum(&:compute_extras_price)

    count_of_items_after_promotion = (BigDecimal(affected_order_items.count) * to / from).ceil
    costs_of_promotion_items = affected_order_items.take(count_of_items_after_promotion).sum(&:compute_pizza_price)

    costs_of_extras_in_promotion_items + costs_of_promotion_items
  end
end
