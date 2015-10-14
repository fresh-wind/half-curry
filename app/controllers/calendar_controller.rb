class CalendarController < ApplicationController
  def index
    puts Food.new().get_foods()
  end
end
