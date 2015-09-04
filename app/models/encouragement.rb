class Encouragement < ActiveRecord::Base
  belongs_to :user
  belongs_to :goal
  validates :user_id, presence: true
  validates :goal_id, presence: true
end
