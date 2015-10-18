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
    $('#message_area').append('<div><p><a href="http://recipe.rakuten.co.jp/category/12-105/" target="brabk" alt="きのこを使用したレシピ一覧">
                <b>きのこ</b>を使用したレシピ一覧</a></p>
            <p><a href="http://recipe.rakuten.co.jp/category/12-448/" target="brabk" alt="かぼちゃを使用したレシピ一覧">
                <b>かぼちゃ</b>を使用したレシピ一覧</a></p>
            <p><a href="http://recipe.rakuten.co.jp/category/11-70-55/" target="brabk" alt="鮭を使用したレシピ一覧">
                <b>鮭</b>を使用したレシピ一覧</a></p></div>')

#    $('#message_area').append('<div>'+ /json/index?calendardata=recipe +'</div>')
#    $.get(
#        "/json/index?calendardata=recipe",
#        null,
#        (data) => 
#            $('#message_area').append('<div>testeteetete</div>')
#            $("#message_area").append("----- データ取得結果 -----").append("<br/>");
#            for (i in data) {
#                $("#message_area").append(i + ": " + data[i]).append("<br/>");
#            }
#            $("#message_area").append(data);
#    );
