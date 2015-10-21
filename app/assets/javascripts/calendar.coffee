# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
    $('#calendar').fullCalendar({#
        header: {
           #right: 'week,month,today, prev,next'
           right: 'prev,next'
        },
        views: {
            week: {
                type: 'basicWeek',
                duration: { days: 31 },
                buttonText: '31 days',
                columnFormat: 'DD ddd'
            }
        },
        defaultDate: moment().startOf('month'),
        defaultView: 'week',
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
            },
            {
                #ユーザーイベント
                url: '/json/index?calendardata=userevents'
            }
        ],
        lang: 'ja'
        height: 430
        
        eventRender: (events, element) ->
    	    if events.img
    	        $(element.context).css("border-color", "transparent")
    	        $(element.context).css("background-color", "transparent")
    	        $(element.context).html('<img class="photo" width="15px"  height="12px" src="' + events.img + '" />')

        # fullCalendarのイベントがすべて完了してからコールされる処理
        eventAfterAllRender: ->
            # ローディング表示を非表示に。
            $("#loading").hide()
})
    $.get('/json/index?calendardata=recipe', null, (recipes) ->
        #console.log recipes
        for recipe in recipes
            $('#message_area').append('<div><p><a href=' + recipe['url'] + ' target="brabk" alt=' + recipe['name'] + 'を使用したレシピ一覧>
            <b>' + recipe['name'] + '</b>を使用したレシピ一覧</a></p></div>')
    )