class Ingredient < ApplicationRecord
  validates :name, presence: true
  validates :price, numericality: { greater_than_or_equal: 0 }
end
