class PizzaSize < ApplicationRecord
  validates :name, presence: true
  validates :multiplier, numericality: { greater_than: 0 }
end
