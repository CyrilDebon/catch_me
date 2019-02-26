class Line < ApplicationRecord
  has_many :directions
  has_many :stops, through: :directions
  enum kind: [:bus, :tramway, :ferry]
end
