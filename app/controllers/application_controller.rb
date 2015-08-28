class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :setgoals, only: [:show, :edit, :index]
  before_action :profile_check

	def profile_check
    if user_signed_in? && current_user.profile.incomplete?
      flash[:notice] = "Please complete your profile!"
      redirect_to edit_profile_path(current_user.profile)
    end
  end

  def setgoals
	   @allgoals = Goal.completed
	end

	def admin_pass
		if current_user.has_role? :admin
          @profiles = Profile.all
          @contacts = Contact.all
      else
          redirect_to home_index_path
      end
  end

end
