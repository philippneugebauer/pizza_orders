class PizzaSize < ApplicationRecord
  has_many :promotions

  validates :name, presence: true
  validates :multiplier, numericality: { greater_than: 0 }
  validates :name, uniqueness: true
end
