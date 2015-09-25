class JsonController < ApplicationController
  def index
    
    weather = Weather.new()
    
    @weather = weather.getWeather
    
    render :text => @weather
    
  end

  def show
  end

end
