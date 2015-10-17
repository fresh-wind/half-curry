require "fullcalendar_event.rb"
require 'net/http'
require 'uri'
require 'json'

class Userevent
    include ActiveModel::Model

    def get_events
        
        json_file_path = "dummy_data.json"
    
        json_data = open(json_file_path) do |io|
          JSON.load(io)
        end
        
        events = Array.new()
        json_data["events"].each do |e|
            event = FullCalendarEvent.new()

            event.title = e["title"]
            event.start = e["start"]
            event.end = e["end"]
            
            events.push(event)
        end
        
        return events.to_json()
    end
end
