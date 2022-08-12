class Promotion < ApplicationRecord
  belongs_to :pizza_size
  belongs_to :pizza
end
