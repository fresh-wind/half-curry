class JsonController < ApplicationController
  def index

    calendardata = params[:calendardata]
      case calendardata
      when 'weather' then render :text => Weather.new().get_weather()
      when 'holidays' then render :json => GoogleApi.new().holidays()
      when 'foods' then render :json => Food.new().get_foods()
      else
      end

  end

  def show
  end

end
