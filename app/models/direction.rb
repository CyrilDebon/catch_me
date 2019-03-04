class Direction < ApplicationRecord
  belongs_to :line
  has_many :stops

  delegate :code, to: :line
  delegate :background, to: :line
end
