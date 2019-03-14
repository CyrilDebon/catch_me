class Stop < ApplicationRecord
  belongs_to :direction
  has_one :line, through: :direction
  has_many :favorites

  geocoded_by :location
  after_validation :geocode

  delegate :code, :background, :kind, to: :direction

  include PgSearch
  pg_search_scope :search_by_keyword, against: [
    :name
  ], associated_against: {
    line: [:name]
  },
  using: {
    tsearch: {
      prefix: true
    }
  }

  def tbm_stop_id
    tbm_id.split(':')[-1]
  end

  def stop_in_night?
    d1 = "01:30"
    d2 = "04:59"
    Time.now.strftime("%H:%M").between?( d1, d2)
  end
end
