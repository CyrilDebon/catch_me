class Stops::NearsController < ApplicationController

  def show
    @nearest_stop = current_or_guest_user.stops.near(user_coordinates).first

    if @nearest_stop.present?
      respond_to do |format|
        format.json # render stops/nears/show.json.jbuilder
      end
    else
      render json: { error: "not found" }, status: :not_found
    end
  end


  private

  def user_coordinates
    [params[:lat], params[:lng]]
  end
end
