require "fullcalendar_event.rb"
require 'net/http'
require 'uri'
require 'json'

class Food
    include ActiveModel::Model

    PROPERTY_PATH = "http://linkdata.org/property/rdf1s2505i#"

    def get_foods

        uri = URI.parse('http://linkdata.org/api/1/rdf1s2505i/In_season_foods_rdf.json')
        date = Date.today
        events = []
    
        JSON.parse(Net::HTTP.get(uri)).each do |index, items|
            event = FullCalendarEvent.new()
    
            months = items[PROPERTY_PATH+"inseason_month"][0]["value"].split("-")
            event.title = items[PROPERTY_PATH+"food"][0]["value"]
            event.start = date.year.to_s+"-"+"%02d" % months[0].delete("月")
            #TODO:日付計算は適当なので実用にはしっかり計算する必要あり
            event.end = date.year.to_s+"-"+"%02d" % (months[1].delete("月").to_i+1)
            event.className = 'foods'
    
            events.push(event)
        end
    
        return events

    end 
end
