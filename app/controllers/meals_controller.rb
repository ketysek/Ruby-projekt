class MealsController < ApplicationController
  def index
    @meals = Meal.all
  end

  def show
    @meal = Meal.find(params[:id])
  end

  def new
    @meal = Meal.new
  end

  def edit
    @meal = Meal.find(params[:id])
  end

  def create
    @meal = Meal.new(meal_params)
   
    if @meal.save
      params[:meal][:alergen_ids].each do |alergen_id|
        if !alergen_id.empty?
          @meal.alergens << Alergen.find(alergen_id)
        end
      end
      redirect_to @meal
    else
      render 'new'
    end
  end

  def update
    @meal = Meal.find(params[:id])

    if @meal.update(meal_params)
      alergens = []
      params[:meal][:alergen_ids].each do |alergen_id|
        if !alergen_id.empty?
          alergens << Alergen.find(alergen_id)
        end
      end
      @meal.alergens = alergens
      redirect_to @meal
    else
      render 'edit'
    end
  end

  def destroy
    @meal = Meal.find(params[:id])
    @meal.destroy

    redirect_to meals_path
  end

  private
    def meal_params
      params.require(:meal).permit(:title, :kind, :price)
    end
end
