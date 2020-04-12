class TweetsController < ApplicationController
	# skip_before_action :authenticate_user!
  def new
  end

  def create
		@tweet = Tweet.new(tweet_params)
		if @tweet.save
			redirect_back fallback_location: root_path
		end
	end

	private

	# Never trust parameters from the scary internet, only allow the white list through.
  def tweet_params
    params.fetch(:tweet).permit(:content, :user_id)
  end
end
