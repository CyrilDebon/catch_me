class Passage
  # {
  #   "vehicle_lattitude":-5.9838563093588,
  #   "vehicle_longitude":-1.3630812101096,
  #   "waittime_text":"4 minutes",
  #   "trip_id":"268551353",
  #   "schedule_id":"271245202",
  #   "destination_id":"5261",
  #   "destination_name":"LA CITE DU VIN",
  #   "departure":"2019-02-27 15:47:42",
  #   "departure_commande":"2019-02-27 15:47:42",
  #   "departure_theorique":"2019-02-27 15:48:26",
  #   "arrival":"2019-02-27 15:47:42",
  #   "arrival_commande":"2019-02-27 15:47:42",
  #   "arrival_theorique":"2019-02-27 15:48:26",
  #   "comment":"",
  #   "realtime":"1",
  #   "waittime":"00:04:17",
  #   "updated_at":"2019-02-27 15:40:42",
  #   "vehicle_id":"1315",
  #   "vehicle_position_updated_at":"2019-02-27 15:43:16",
  #   "origin":"bdsi_tram"
  # }

  attr_reader :destination

  def initialize(attributes = {})
    @destination = attributes["destination_name"]
  end
end

passage.destination # => "LA CITE DU VIN"

