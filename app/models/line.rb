class Line < ApplicationRecord
  has_many :directions
  has_many :stops, through: :directions

  enum kind: [:bus, :tramway, :ferry]

  acts_as_list

  default_scope { order(position: :asc) }

  def long_code?
    code.length > 2
  end
end
