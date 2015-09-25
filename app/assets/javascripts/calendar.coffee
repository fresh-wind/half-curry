# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# デフォルト表示（javascriptの書き方）
#$(document).ready(function() {
    #$('#calendar').fullCalendar({
    #})
#});

# デフォルト表示（coffeecriptの書き方）
#$(document).ready ->
    #$('#calendar').fullCalendar({})

$(document).ready ->
    $('#calendar').fullCalendar({#
        # 日本の祝日表示（coffeecriptの書き方）
        #'<YOUR API KEY>',
        googleCalendarApiKey: 'AIzaSyCGtyHc6rdZk4BOKg8TpLuAhJKOnQnD2MI',
        eventSources: [
            {
                googleCalendarId: 'ja.japanese#holiday@group.v.calendar.google.com',
                className: 'gcal-event'
            },
            # 天気の表示
            {
                url: '/json/index',
                color: '#79b74a'
            }
        ],
        lang: 'ja'
    })
