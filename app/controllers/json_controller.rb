class JsonController < ApplicationController
  def index

    calendardata = params[:calendardata]
      # TODO:ハッカソン用にわざと遅延処理
      sleep(1)

      case calendardata
      when 'weather' then render :text => Weather.new().get_weather()
      when 'holidays' then render :json => GoogleApi.new().holidays()
      when 'foods' then render :json => Food.new().get_foods()
      when 'userevents' then render :json => Userevent.new().get_events()
      when 'recipe' then render :json => Food_and_recipe.new().three_food_data_creater
      else
      end

  end

  def show
  end

end
