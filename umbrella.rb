# Write your soltuion here!
require "dotenv/load"

gmap_key = ENV.fetch("gmap")
pirate_key =  ENV.fetch("pirate")

require"http"
require"json"
require"dotenv/load"

pp "What is your location?"
their_location = gets

gmap_url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + their_location + "&key=" + gmap_key
raw_gmap_response = HTTP.get(gmap_url)
parse_gmap = JSON.parse(raw_gmap_response)
lat_coordinates = parse_gmap.dig("results", 0, "geometry", "location", "lat")
lng_coordinates = parse_gmap.dig("results", 0, "geometry", "location", "lng")
pp lat_coordinates
pp lng_coordinates

pirate_weather_url = "https://api.pirateweather.net/forecast/" + pirate_key + "/" + lat_coordinates + "," + lng_coordinates

# Place a GET request to the URL
raw_pirate_response = HTTP.get(pirate_weather_url)
parse_pirate = JSON.parse(raw_pirate_response)

currently_hash = parsed_response.fetch("currently")
current_temp = currently_hash.fetch("temperature")

pp current_temp

puts "The current temperature is " + current_temp.to_s + "."
