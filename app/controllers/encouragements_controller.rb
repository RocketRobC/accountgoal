class EncouragementsController < ApplicationController

  def encourage
    @encourage = Encouragement.create!(user_id: params[:user_id], goal_id: params[:goal_id])
    if @encourage.save
      flash[:warning] = "Something is working"
    else
      flash[:warning] = "It's still broken, you didn't really want to do that."
    end
    redirect_to :back
  end

  def create
    @encourage = Encouragement.create!(user_id: params[:user_id], goal_id: params[:goal_id])
    if @encourage.save
      flash[:warning] = "Something is working"
    else
      flash[:warning] = "It's broken, you didn't really want to do that."
    end
    redirect_to :back
  end

  # def create
  #   @goal = @goal.users(params[:id])
  #   current_user.give_encouragement
  #   respond_to do |format|
	# 		format.html {redirect_to :back}
	# 		format.js
  #   end
  # end

  def destroy

  end

end
