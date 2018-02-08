class MenusController < ApplicationController
  def index
    @menus = Menu.all
  end

  def show
    @menu = Menu.find(params[:id])
  end

  def new
    @menu = Menu.new
  end

  def edit
    @menu = Menu.find(params[:id])
  end

  def create
    @menu = Menu.new(menu_params)

    if @menu.save
      if !params[:menu][:appetizer_id].empty?
        @menu.meals << Meal.find(params[:menu][:appetizer_id])
      end
      if !params[:menu][:soup_id].empty?
        @menu.meals << Meal.find(params[:menu][:soup_id])
      end
      if !params[:menu][:main_id].empty?
        @menu.meals << Meal.find(params[:menu][:main_id])
      end
      if !params[:menu][:sweet_id].empty?
        @menu.meals << Meal.find(params[:menu][:sweet_id])
      end
      redirect_to @menu
    else
      render 'new'
    end
  end

  def update
    @menu = Menu.find(params[:id])

    if @menu.update(menu_params)
      redirect_to @menu
    else
      render 'edit'
    end
  end

  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy

    redirect_to menus_path
  end

  private
    def menu_params
      params.require(:menu).permit(:date)
    end
end
