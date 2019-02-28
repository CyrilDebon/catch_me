class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :stop

  validates :user, uniqueness: { scope: :stop }
end
