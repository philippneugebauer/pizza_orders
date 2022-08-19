class Promotion < ApplicationRecord
  has_many :order_promotions
  has_many :orders, through: :order_promotions

  belongs_to :pizza_size
  belongs_to :pizza

  validates :code, :pizza, :pizza_size, presence: true
  validates :from, numericality: { only_integer: true, greater_than: 0 }
  validates :to, numericality: { only_integer: true, greater_than_or_equal: 0 }
  validates :code, uniqueness: true
end
