class HomeController < ApplicationController
	skip_before_action :authenticate_user!

  def index
  	if user_signed_in?
	  	@goals = current_user.goals.order_created
	  	@goal = Goal.new
	  	@feed_items = current_user.feed.order_completed
	  	@profile = current_user.profile
	  	@mygoalsfeed = current_user.goals.order_created
	  	@usergoals = @profile.user.goals.completed
	  	# @completed_goals = current_user.goals.completed.order_created
	  	# @incomplete_goals = current_user.goals.incomplete.order_created
	  	
	  end
	end


end
