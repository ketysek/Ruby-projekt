class CommentsController < ApplicationController
  def create
    @meal = Meal.find(params[:meal_id])
    @comment = @meal.comments.create(comment_params)
    redirect_to meal_view_path(@meal)
  end
 
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :email)
    end
end
