class Discount < ApplicationRecord
  has_many :orders

  validates :code, presence: true
  validates :percentage, numericality: { greater_than: 0, less_than: 100 }
  validates :code, uniqueness: true
end
