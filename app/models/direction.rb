class Direction < ApplicationRecord
  belongs_to :line
  has_many :stops
end
