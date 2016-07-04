class GoalsController < ApplicationController
  before_action :set_goal, only: [:completed, :show, :edit, :update, :destroy, :encourage]



  def completed
    @goal.update_attributes(:complete => true, :completed_at => DateTime.now.beginning_of_day)
    redirect_to :back
  end

  def encourage
    @encourage = Encouragement.create!(user: current_user, goal: @goal)
    if @encourage.save
      # EncouragementMailer.encouragement_received(current_user, @goal.id).deliver_now
    else
      flash[:warning] = "It's broken, you didn't really want to do that."
    end
  end

  # GET /goals
  # GET /goals.json
  def index
    @goals = current_user.goals
  end

  # GET /goals/1
  # GET /goals/1.json
  def show
    @goals = current_user.goals
  end

  # GET /goals/new
  def new
    @goal = Goal.new
    @goals = current_user.goals.order_created
  end

  # GET /goals/1/edit
  def edit
    @goals = current_user.goals
  end

  # POST /goals
  # POST /goals.json
  def create
    @goal = Goal.new(goal_params)
    @goal.user = current_user
    @goals = current_user.goals
    respond_to do |format|
      if @goal.save
        format.html { redirect_to home_index_path, notice: 'Goal was successfully created.' }
        # format.json { render :show, status: :created, location: @goal }
      else
        format.html { render :new, notice: "There was an error updating your goal." }
        # format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /goals/1
  # PATCH/PUT /goals/1.json
  def update
    @goals = current_user.goals
    respond_to do |format|
      if @goal.update(goal_params)
        format.html { redirect_to home_index_path, notice: 'Goal was successfully updated.' }
        # format.json { render :show, status: :ok, location: @goal }
      else
        format.html { render :edit, notice: 'There was an error updating your goal.' }
        # format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goals/1
  # DELETE /goals/1.json
  def destroy
    @goal.destroy
    respond_to do |format|
      format.html { redirect_to home_index_url, notice: 'Goal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal
      @goal = Goal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def goal_params
      params.require(:goal).permit(:user_id, :startdate, :enddate, :name, :details, :complete, :completed_at)
    end
end
