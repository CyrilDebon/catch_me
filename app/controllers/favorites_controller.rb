class FavoritesController < ApplicationController

  def create
    @stop = Stop.find(params[:stop_id])
    @favorite = @stop.favorites.new(user: current_or_guest_user)
    @favorite.save

    respond_to do |format|
      format.html { redirect_to stop_path(@stop) }
      format.js # render create.js.erb
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy

    respond_to do |format|
      format.js
    end

  end
end
