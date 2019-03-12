class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :favorites
  has_many :stops, through: :favorites

  LANGUAGES = {'English' => 'en','French' => 'fr'}

  def test_method
    byebug
  end

  def favorite(stop)
    favorites.find_by(stop: stop)
  end

  def favorited?(stop)
    favorite(stop).present?
  end

  def has_favorites?
    favorites.any?
  end

  def guest?
    guest
  end
end
