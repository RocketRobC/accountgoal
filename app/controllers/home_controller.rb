class HomeController < ApplicationController
	skip_before_action :authenticate_user!

  def index
  	if user_signed_in?
	  	# @goals = current_user.goals.order_created
	  	@user ||= current_user
	  	@followed_users = @user.followed_users.limit(6)
	  	@followers = @user.followers.limit(6)
	  	@goal = Goal.new
	  	@feed_items = current_user.feed.order_completed
	  	@profile = current_user.profile
	  	@mygoalsfeed = current_user.goals.order_created
	  	@usergoals = @profile.user.goals.completed
	  	@goals = @profile.user.goals.order_created
	  	@completed_goals = @profile.user.goals.completed.order_created
	  	@incomplete_goals = @profile.user.goals.incomplete.order_created
	  	@complete_before_enddate = @profile.user.goals.complete_before_enddate

	  	if params[:filter]
	  		if params[:filter] == 'complete'
	  			@goals =  @profile.user.goals.completed.order_created
	  		elsif params[:filter] == 'incomplete'
	  			@goals =  @profile.user.goals.incomplete.order_created
	  		end
	  	end

	  end
	end


end
