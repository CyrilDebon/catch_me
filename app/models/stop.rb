class Stop < ApplicationRecord
  belongs_to :direction
  has_many :favorites
end
