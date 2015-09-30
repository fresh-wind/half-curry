require "fullcalendar_event.rb"
require 'net/http'
require 'uri'
require 'json'

class Weather
    include ActiveModel::Model

    def get_weather

        uri = URI.parse('http://weather.livedoor.com/forecast/webservice/json/v1?city=120010')
        json = Net::HTTP.get(uri)
        weathers = JSON.parse(json)

        events = Array.new()
        weathers["forecasts"].each do |w|
            event = FullCalendarEvent.new()
            
            event.title = w["telop"]
            event.start = w["date"]
            event.color = '#79b74a'

            events.push(event)       
        end
        
        return events.to_json()
    end

end
