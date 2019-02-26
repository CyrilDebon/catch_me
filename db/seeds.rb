def tbm_api(url)
  JSON.parse(HTTP.get(url).body.to_s)
end


Line.destroy_all

lines_data = tbm_api("https://ws.infotbm.com/ws/1.0/network/get-lines-informations")

lines_data.each do |line_data|
  Line.create!(
    tbm_id: line_data['id'],
    name: line_data['name'],
    background: line_data['bgColor'],
    text_color: line_data['textColor'],
    kind: line_data['type'].downcase.to_sym,
    code: line_data['code']
  )
end

count = 0

Line.all.each do |line|
  line_data = tbm_api("https://ws.infotbm.com/ws/1.0/network/line-informations/#{line.tbm_id}")
  count += line_data["routes"].map { |route| route["stopPoints"] }.flatten.count
end

puts "#{count} stop points"

