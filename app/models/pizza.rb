class Pizza < ApplicationRecord
  has_many :promotions

  validates :name, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :name, uniqueness: true
end
