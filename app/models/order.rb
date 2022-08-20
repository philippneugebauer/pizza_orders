class Order < ApplicationRecord
  attribute :state, :string, default: 'open'

  has_many :order_items, inverse_of: :order, dependent: :delete_all
  has_many :order_promotions
  has_many :promotions, through: :order_promotions
  accepts_nested_attributes_for :order_items, reject_if: :all_blank, allow_destroy: true

  belongs_to :discount, optional: true

  validates :order_items, presence: true
  validates :price, numericality: true
  validates :state, inclusion: { in: %w(open completed), message: "%{value} is not a valid state" }

  scope :open, -> { where(state: "open") }

  def self.possible_states
    %w(open completed)
  end

  def self.build(order_params)
    order = Order.new(discount_id: order_params[:discount_id])
    order.order_promotions.build(order_params[:promotions].filter { |e| !e.blank? }.map { |p| { promotion_id: p } })
    order.order_items.build(build_order_items(order_params[:order_items_attributes]))
    order.order_items.map.with_index do |oi, i|
      oi.extras.build(build_order_item_ingredient(order_params[:order_items_attributes], "extras", i))
      oi.omited.build(build_order_item_ingredient(order_params[:order_items_attributes], "omited", i))
    end
    order.compute_price
    order
  end

  def self.build_order_items(order_items_attributes)
    order_items_attributes.values.map do |oi|
      { pizza_id: oi[:pizza_id].to_i, pizza_size_id: oi[:pizza_size_id].to_i }
    end
  end

  def self.build_order_item_ingredient(order_items_attributes, key, index)
    order_items_attributes.values[index][key].filter { |e| !e.blank? }.map do |e|
      { ingredient_id: e, kind: key }
    end
  end

  def compute_price
    costs_of_promotion_items = 0
    non_promotional_order_items = order_items

    promotions.each do |p|
      result = p.compute_promotion(order_items)

      non_promotional_order_items -= result[:affected_order_items]
      costs_of_promotion_items += result[:promotion_item_costs]
    end

    price = non_promotional_order_items.sum(&:compute_price) + costs_of_promotion_items
    price = discount.discount_price(price) if discount
    self.price = price
  end
end
