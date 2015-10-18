class CalendarController < ApplicationController
  def index
    # puts Food.new().get_foods()
    Food_and_recipe.new().three_food_data_creater
  end
end
