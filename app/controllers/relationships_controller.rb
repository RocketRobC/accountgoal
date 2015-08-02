class RelationshipsController < ApplicationController

	def create
		@user = User.find(params[:relationship][:followed_id])
		@profile = @user.profile
		current_user.follow!(@user)
		respond_to do |format|
			format.html {redirect_to users_path}
			format.js
		end
	end

	def destroy
		@user = Relationship.find(params[:id]).followed
		current_user.unfollow!(@user)
		respond_to do |format|
			format.html {redirect_to users_path}
			format.js
		end
	end
end
