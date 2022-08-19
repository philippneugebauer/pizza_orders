class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :pizza
  belongs_to :pizza_size

  has_many :order_item_ingredients
  has_many :extras, -> { where(kind: "extras") }, class_name: 'OrderItemIngredient'
  has_many :omited, -> { where(kind: "omited") }, class_name: 'OrderItemIngredient'

  validates :order, :pizza, :pizza_size, presence: true

  def compute_price
    compute_pizza_price() + compute_extras_price()
  end

  def compute_pizza_price
    pizza.price * pizza_size.multiplier
  end

  def compute_extras_price
    extras.map {|e| e.ingredient.price}.sum() * pizza_size.multiplier
  end
end
