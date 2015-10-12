# -*- coding: utf-8 -*-
require "open-uri"
require "cgi"
require "json"

class GoogleApi
  def holidays(today = nil)

    api_key = 'AIzaSyCGtyHc6rdZk4BOKg8TpLuAhJKOnQnD2MI'
    calendarId = 'ja.japanese#holiday@group.v.calendar.google.com'
    uri = "https://www.googleapis.com/calendar/v3/calendars/#{CGI.escape(calendarId)}/events?orderBy=startTime&singleEvents=true&timeZone=Asia%2FTokyo&timeMin=#{CGI.escape(Time.now.iso8601)}&key=#{api_key}"

    today = (today || Date.today)
    events = []

    JSON.parse(open(uri).read)['items'].each do |item|
      events.push([
      id: item['id'],
      title: item['summary'],
      start: item['start']['dateTime'] || item['start']['date'],
      end: item['end']['dateTime'] || item['end']['date'],
      url: item['htmlLink'],
      location: item['location'],
      description: item['description']
      ])
    end

    return events
  rescue => e
    return e
  end
end
