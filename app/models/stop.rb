class Stop < ApplicationRecord
  belongs_to :direction
  belongs_to :favorite
end
