class PopupsController < ApplicationController
  def index
    @stop_coordinate = current_or_guest_user.favorites.map do |favorite|
      {
        lat: favorite.stop.latitude,
        lng: favorite.stop.longitude,
        name: favorite.stop.name
      }
    end
  end
end
