class RatingsController < ApplicationController
  def create
    @rate_exists = Rating.where(meal_id: rating_params[:meal_id], ip_address: request.remote_ip)
    if @rate_exists.length > 0
      render json: { error: 'Already voted for this meal' }, status: 401
    else
      @rating = Rating.new({ value: rating_params[:value], ip_address: request.remote_ip, meal_id: rating_params[:meal_id] })
      @rating.save!
    end
  end

  private
    def rating_params
      params.require(:rating).permit(:value, :meal_id)
    end
end
