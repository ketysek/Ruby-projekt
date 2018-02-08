class HomeController < ApplicationController
  def index
    @menus = Menu.where('date >= ?', DateTime.now).order(:date)
  end

  def show
    @meal_view = Meal.find(params[:id])
    @rating_avg = Rating.where(meal_id: params[:id]).average(:value)
  end
end
