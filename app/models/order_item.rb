class OrderItem < ApplicationRecord
  belongs_to :order

  validates :order, :name, :size, presence: true
end
