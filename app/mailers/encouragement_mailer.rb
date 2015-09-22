class EncouragementMailer < ApplicationMailer

  def encouragement_received(current_user, goal_id)
    @goal = Goal.find(goal_id)
    @user = @goal.user
    @encouragement_giver = current_user
    mail(to: @user.email, subject: "You've received encouragement on Goalkeeper.")
  end
end
