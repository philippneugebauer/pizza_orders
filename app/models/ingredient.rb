class Ingredient < ApplicationRecord
  validates :name, presence: true
  validates :price, numericality: true
end
