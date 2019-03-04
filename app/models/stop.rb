class Stop < ApplicationRecord
  belongs_to :direction
  has_many :favorites

  geocoded_by :location
  after_validation :geocode

  delegate :code, to: :direction
  delegate :background, to: :direction

  def tbm_stop_id
    tbm_id.split(':')[-1]
  end
end
