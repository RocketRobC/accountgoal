class User < ActiveRecord::Base
  has_one :profile, dependent: :destroy
  has_many :goals, dependent: :destroy
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :reverse_relationships, source: :follower

  has_many :encouragements, dependent: :destroy

  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # devise :omniauthable, :omniauth_providers => [:facebook]

  after_create :assign_goalsetter_role
  after_create :initial_create_profile

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.create_profile
      user.profile.fname = auth.info.first_name   # assuming the user model has a name
      user.profile.lname = auth.info.last_name
      user.profile.profileimage = auth.info.image # assuming the user model has an image
      # user.profile.save
    end
  end

  def assign_goalsetter_role
  	self.add_role :goalsetter
  end

  def initial_create_profile
    create_profile!
  end

  def follow!(other_user)
  	relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
  	relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
  	relationships.find_by(followed_id: other_user)
  end

  def feed
    following_ids = "SELECT followed_id FROM relationships WHERE follower_id = :user_id"
    Goal.where("user_id IN (#{following_ids}) OR user_id = :user_id", user_id: id)
  end

  def self.search(search)
    where('email  ILIKE ?', "%#{search}%")
  end

  def given_encouragement?(goal)
    encouragements.find_by(goal_id: goal.id)
  end

  def give_encouragement
    encouragements.create!
  end

  def removes_encouragement(goal)
    encournagements.find_by(user_id: goal.id).destroy
  end

end
