class Stop < ApplicationRecord
  belongs_to :direction
  has_many :favorites

  def tbm_stop_id
    tbm_id.split(':')[-1]
  end
end
