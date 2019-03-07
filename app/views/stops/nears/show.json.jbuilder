json.html(render partial: "stops/nears/notification", locals: { stop: @nearest_stop }, formats: :html)
json.stop_id @nearest_stop.tbm_stop_id
