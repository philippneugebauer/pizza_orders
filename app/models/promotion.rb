class Promotion < ApplicationRecord
  belongs_to :pizza_size
  belongs_to :pizza

  validates :code, :pizza, :pizza_size, :to, presence: true
  validates :from, numericality: { only_integer: true, greater_than: 0 }
  validates :code, uniqueness: true
end
