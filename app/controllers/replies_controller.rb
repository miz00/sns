class RepliesController < ApplicationController

    def new
        @users = current_user
        @tweets = Tweet.new
    end

    def create
        @tweet = Tweet.new(tweet_params)
        if @tweet.save
            Reply.create(tweet_id: @tweet.id, target_tweet_id: params[:tweet_id])
            redirect_to users_tweets_timeline_path, notice: "tweet was successfully created."
        else
            redirect_to new_user_tweet_reply_path(current_user,params[:tweet_id]), notice: "tweet was not created."
        end
    end

    private
    def tweet_params
        params.require(:tweet).permit(:text, :privacy_status).merge(user_id: params[:user_id]) 
    end

end