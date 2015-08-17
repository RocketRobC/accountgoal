class ProfilesController < ApplicationController
  prepend_before_action :set_profile, only: [:show, :destroy]
  prepend_before_action :admin_pass, only: [:index] 


  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.all
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    @compchart = current_user.goals.completed
    @goal = Goal.new
    @profiles = Profile.all
    @usergoals = @profile.user.goals.completed
    @goals = @profile.user.goals.paginate(:page => params[:page], :per_page => 15).order_created
    @completed_goals = @profile.user.goals.completed.order_created
    @incomplete_goals = @profile.user.goals.incomplete.order_created
    @complete_before_enddate = @profile.user.goals.complete_before_enddate
    @followed_users = @profile.user.followed_users.limit(6)
    @followers = @profile.user.followers.limit(6)

    if params[:filter]
      if params[:filter] == "complete"
        @goals = @profile.user.goals.paginate(:page => params[:page], :per_page => 15).completed.order_created
      elsif params[:filter] == "incomplete"
        @goals = @profile.user.goals.paginate(:page => params[:page], :per_page => 15).incomplete.order_created
      end
    end
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
    @profile.user = current_user

  end

  # GET /profiles/1/edit
  def edit
    @profile = current_user.profile
    @goals = current_user.goals.order_created
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user

    respond_to do |format|
      if @profile.save
        format.html { redirect_to home_index_path, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    @profile = current_user.profile
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to edit_profile_path, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:user_id, :fname, :lname, :city, :country, :profileimage)
    end
end
