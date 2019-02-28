class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.all
  end

  def create
    @favorite = Favorite.new(favorite_params)
    if @favorite.save
      redirect_to favorites_path
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy

    # redirect_to
  end

  private

  def favorite_params
    params.require(:favorites).permit(:stop_id)
  end
end
