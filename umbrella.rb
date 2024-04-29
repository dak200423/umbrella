

require "http"
require "json"

pp "Where are you located?"
 # user_location = gets.chomp.gsub(" ", "%20") DELETE COMMENT AT THE END

 user_location = "Chicago"

pp user_location

maps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + user_location + "&key=" + ENV.fetch("GMAPS_KEY")

response = HTTP.get(maps_url)
raw_response = response.to_s
parsed_response = JSON.parse(raw_response)

results_hash = parsed_response.fetch("results")
first_results_array = results_hash.at(0)
geometry_hash = first_results_array.fetch("geometry")
location_hash = geometry_hash.fetch("location")

pp latitude = location_hash.fetch("lat")
pp longitude = location_hash.fetch("lng")

pirate_weather_url = "https://api.pirateweather.net/forecast/" + ENV.fetch("PIRATE_WEATHER_KEY") + "/" + latitude.to_s + "," + longitude.to_s

raw_response_pirate = HTTP.get(pirate_weather_url)
parsed_response_pirate = JSON.parse(raw_response_pirate)

pp parsed_response_pirate
