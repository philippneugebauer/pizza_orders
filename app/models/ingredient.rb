class Ingredient < ApplicationRecord
  has_many :order_item_ingredients
  has_many :order_items, through: :order_item_ingredients

  validates :name, presence: true
  validates :price, numericality: { greater_than_or_equal: 0 }
  validates :name, uniqueness: true
end
