class Pizza < ApplicationRecord
  has_many :promotions, dependent: :delete_all

  validates :name, presence: true
  validates :price, numericality: { greater_than: 0 }
end
