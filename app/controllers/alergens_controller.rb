class AlergensController < ApplicationController
  def index
    @alergens = Alergen.all
  end

  def show
    @alergen = Alergen.find(params[:id])
  end

  def new
    @alergen = Alergen.new
  end

  def edit
    @alergen = Alergen.find(params[:id])
  end

  def create
    @alergen = Alergen.new(alergen_params)

    if @alergen.save
      redirect_to @alergen
    else
      render 'new'
    end
  end

  def update
    @alergen = Alergen.find(params[:id])

    if @alergen.update(alergen_params)
      redirect_to @alergen
    else
      render 'edit'
    end
  end

  def destroy
    @alergen = Alergen.find(params[:id])
    @alergen.destroy

    redirect_to alergens_path
  end

  private
    def alergen_params
      params.require(:alergen).permit(:name, :identifier)
    end
end
