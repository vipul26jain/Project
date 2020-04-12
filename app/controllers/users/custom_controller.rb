class Users::CustomController < ApplicationController
	def profile
		@user = User.find(params[:id])
		@followers = @user.followers
		@followings = @user.followings
	end

	def follow_user
		@follower = UserFollower.find_by(follower_id: params[:follower_id], following_id: params[:following_id])
		if @follower.present?
			flash[:alert] = "Already following"
		else
			@user_follower = UserFollower.new
			@user_follower.follower_id = params[:follower_id]
			@user_follower.following_id = params[:following_id]
			if @user_follower.save!
				flash[:notice] = "Success"				
			end
		end
		@all_users = User.all.where.not(id: current_user.id)
		@feed_tweets = Tweet.all.where(user_id: [current_user.followings.ids]).reverse

		respond_to do |format|
			format.js
		end
	end

	def unfollow_user		
		@follower = UserFollower.find_by(follower_id: params[:follower_id], following_id: params[:following_id])
		if @follower.present?
			@follower.delete
			flash[:alert] = "Successfully unfollowed"
		else
		end
		@all_users = User.all.where.not(id: current_user.id)
		@feed_tweets = Tweet.all.where(user_id: [current_user.followings.ids]).reverse

		respond_to do |format|
			format.js
		end
	end
end