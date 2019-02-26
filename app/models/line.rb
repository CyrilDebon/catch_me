class Line < ApplicationRecord
  has_many :directions
  enum kind: [:bus, :tramway, :ferry]
end
