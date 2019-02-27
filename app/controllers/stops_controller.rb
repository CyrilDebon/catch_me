class StopsController < ApplicationController
  def show
    @stop = Stop.find(params[:id])
    @stop_tbm = TbmApi.realtime(@stop.tbm_stop_id, @stop.direction.line.code)
  end
end
