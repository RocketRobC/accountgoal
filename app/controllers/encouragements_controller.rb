class EncouragementsController < ApplicationController

  def create
    @goal = Goal.find(params[:goal_id])
    @encourage = Encouragement.create!(user: current_user, goal: @goal)
    if @encourage.save
      EncouragementMailer.encouragement_received(current_user, @goal.id).deliver_later
    else
      flash[:warning] = "It's broken, you didn't really want to do that."
    end
    # redirect_to :back
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
