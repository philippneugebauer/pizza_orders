class Pizza < ApplicationRecord
  validates :name, presence: true
  validates :price, numericality: true
end
