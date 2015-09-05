class Encouragement < ActiveRecord::Base
  belongs_to :goal
  belongs_to :user

  validates :user_id, :goal_id, presence: true

end
