class FavoritesController < ApplicationController

  def create
    stop = Stop.find(params[:stop_id])
    fav = stop.favorites.new(user: current_user)
    fav.save
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
  end
end
