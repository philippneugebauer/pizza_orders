class Discount < ApplicationRecord
  has_many :orders

  validates :code, presence: true
  validates :percentage, numericality: { greater_than: 0, less_than: 100 }
  validates :code, uniqueness: true

  def discount_price(price)
    price - compute_discount_sum(price)
  end

  def compute_discount_sum(price)
    price * percentage / 100
  end
end
