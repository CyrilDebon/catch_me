class MapsController < ApplicationController
  def index
    @stops = Stop.where.not(latitude: nil, longitude: nil)
    @stops = @stops.near([params[:lat], params[:lng]], 1)

    @markers = @stops.map do |stop|
      {
        lat: stop.latitude,
        lng: stop.longitude,
        code: stop.code,
        background: stop.background,
        popup: render_to_string(partial: "stops/stop", locals: { stop: stop })
      }
    end

    respond_to do |format|
      format.js # render maps/index.js.erb
    end
  end
end
