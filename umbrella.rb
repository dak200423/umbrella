

require "http"
require "json"

pp "Where are you located?"
user_location = gets.chomp.gsub(" ", "%20")

# user_location = "Chicago"

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
