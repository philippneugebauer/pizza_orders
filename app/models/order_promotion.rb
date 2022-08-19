class OrderPromotion < ApplicationRecord
  belongs_to :order
  belongs_to :promotion

  validates :order, :promotion, presence: true
end
