class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations
  has_many				:tweets
  has_many				:user_followers
  has_many			 	:following_users, :class_name => 'UserFollower', :foreign_key => :follower_id
  has_many 				:followings ,through: :following_users, :class_name => 'User', :foreign_key => :following_id
  # has_many				:feed_tweets, through: :followings, :class_name => 'Tweet'
  has_many 				:follower_users, :class_name => 'UserFollower', :foreign_key => :following_id
  has_many 				:followers ,through: :follower_users, :class_name => 'User', :foreign_key => :follower_id
end
