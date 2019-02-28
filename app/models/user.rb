class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :favorites
  has_many :stops, through: :favorites

  def favorite(stop)
    favorites.find_by(stop: stop)
  end

  def favorited?(stop)
    favorite(stop).present?
  end
end
