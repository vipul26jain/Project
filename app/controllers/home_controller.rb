class HomeController < ApplicationController
	# skip_before_action :authenticate_user!
  def index
  	if user_signed_in?
  		@all_users = User.all.where.not(id: current_user.id)
  		@feed_tweets = Tweet.all.where(user_id: [current_user.followings.ids]).reverse
  	end
  end
end
