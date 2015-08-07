class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :setgoals, only: [:show, :edit, :index]

	  def setgoals
	    @allgoals = Goal.completed
	  end

end
