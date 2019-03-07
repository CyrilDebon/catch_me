def tbm_api(url)
  JSON.parse(HTTP.get(url).body.to_s)
end


Favorite.destroy_all
User.destroy_all
Stop.destroy_all
Direction.destroy_all
Line.destroy_all

lines_data = TbmApi.lines

lines_data.each do |line_data|
  next if line_data['isHidden']
  line = Line.create!(
    tbm_id: line_data['id'],
    name: line_data['name'],
    background: line_data['bgColor'],
    text_color: line_data['textColor'],
    kind: line_data['type'].downcase.to_sym,
    code: line_data['code']
  )
  puts "#{line.name}:"

  line_full_data = TbmApi.line(line.tbm_id)

  line_full_data['routes'].each do |route_data|
    direction = Direction.create!(
      name: route_data['end'].blank? ? route_data['name'] : route_data['end'],
      line: line
    )
    puts "\t#{direction.name}:"

    route_data['stopPoints'].each do |stop_point_data|
      stop = Stop.create!(
        direction: direction,
        name: stop_point_data['name'],
        latitude: stop_point_data['latitude'],
        longitude: stop_point_data['longitude'],
        tbm_id: stop_point_data['id']
      )
      puts "\t\t- #{stop.name}"
    end
  end
end

# Sort lines

Line.all.sort_by { |line| line.code.to_i }.reverse.each { |line| line.move_to_top }
Line.all.select { |line| line.code.to_i == 0 }.each { |line| line.move_to_bottom}
# Line.where("code LIKE 'BAT%'").first.move_to_top
# Line.find_by_code('Stade').move_to_top
# Line.find_by_code('Arena').move_to_top
Line.find_by_code('C').move_to_top
Line.find_by_code('B').move_to_top
Line.find_by_code('A').move_to_top
