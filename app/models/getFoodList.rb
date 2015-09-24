FOOD_NAME = "http://linkdata.org/property/rdf1s2505i#food"
IN_SEASON = "http://linkdata.org/property/rdf1s2505i#inseason"
IN_SEASON_MONTH = "http://linkdata.org/property/rdf1s2505i#inseason_month"

require 'net/http'
require 'uri'
require 'json'

uri = URI.parse('http://linkdata.org/api/1/rdf1s2505i/In_season_foods_rdf.json')
json = Net::HTTP.get(uri)
season_foods_info = JSON.parse(json)

for i in 1..season_foods_info.length do
    puts season_foods_info["http://linkdata.org/resource/rdf1s2505i#" + i.to_s][FOOD_NAME][0]["value"]
    puts season_foods_info["http://linkdata.org/resource/rdf1s2505i#" + i.to_s][IN_SEASON][0]["value"]
    puts season_foods_info["http://linkdata.org/resource/rdf1s2505i#" + i.to_s][IN_SEASON_MONTH][0]["value"]
    puts "\n"
end 
