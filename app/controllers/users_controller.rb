class UsersController < ApplicationController
	# before_action :authenticate_user!

	def following
		@title = "Following"
		@user = User.find(params[:id])
		@users = @user.followed_users.paginate(page: params[:page])
		@followers = @user.followers
		@followed_users = @user.followed_users

		render "show_follow"
	end

	def followers
		@title = "Followers"
		@user = User.find(params[:id])
		@users = @user.followers.paginate(page: params[:page])
		@followers = @user.followers
		@followed_users = @user.followed_users
		render "show_follow"
	end

	def index
		# @users = User.all
			unless params[:search] == ""
				@users = User.search(params[:search])
			else
				# @users = User.all.order("email ASC")
				@users = User.none
			end
		@profiles = Profile.all
	end

	def show
		@user = User.find(params[:id])
		@users = User.all
	end

	# def create
	# 	@user = User.find(params[:relationship][:followed_id])
	# 	current_user.follow!(@user)
	# 	redirect_to user
	# end

	# def destroy
	# 	@user = Relationship.find(params[:id]).followed
	# 	current_user.unfollow!(@user)
	# 	redirect_to user
	# end

	private

end
