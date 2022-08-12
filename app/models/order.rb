class Order < ApplicationRecord
  attribute :state, :string, default: 'open'

  has_many :order_items, inverse_of: :order, dependent: :delete_all
  accepts_nested_attributes_for :order_items, reject_if: :all_blank, allow_destroy: true

  validates :order_items, presence: true
  validates :price, numericality: true
  validates :state, inclusion: { in: %w(open completed), message: "%{value} is not a valid state" }

  scope :open, -> { where(state: "open") }

  def self.possible_states
    %w(open completed)
  end

end
