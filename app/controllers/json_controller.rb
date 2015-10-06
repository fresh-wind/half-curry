class JsonController < ApplicationController
  def index
    
    weather = Weather.new()
    
    @weather = weather.get_weather
    
    render :text => @weather
    
  end

  def show
  end

end
