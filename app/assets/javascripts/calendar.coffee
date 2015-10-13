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
        #defaultView: 'basicWeek',
        header: {
           center: 'month,week'
        },
        views: {
            week: {
                type: 'basicWeek',
                duration: { days: 31 },
                buttonText: '31 day',
                columnFormat: 'D' + " ddd"
            }
        },
        eventSources: [
            {
                # 天気予報
                url: '/json/index?calendardata=weather'
            },
            {
                # 日本の祝日表示
                url: '/json/index?calendardata=holidays'
            },
            {
                # 旬の食材
                url: '/json/index?calendardata=foods'
            }
        ],
        lang: 'ja'
    })
