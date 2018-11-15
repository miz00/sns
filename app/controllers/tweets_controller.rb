class TweetsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :timeline]

    #GET /users/1/tweets
    # def index
    # end

    #POST /users/1/tweets
    def create
        @tweet = Tweet.new(tweet_params)
        if @tweet.save
            redirect_to user_path(current_user), notice: "tweet was successfully created."
        else
            redirect_to new_user_tweet_path(current_user), notice: "tweet was not created."
        end
    end

    #GET /users/1/tweets/new
    def new
        @tweets = Tweet.new
        @users = current_user
        @path = Rails.application.routes.recognize_path(request.referer)
        @images = Image.new(tweet_id: @tweet)
    end

    #GET /users/1/tweets/:id
    # def show
    # end

    #DELETE /users/1/tweets/:id
    def destroy
        @tweet = Tweet.find(params[:id])
        @tweet.destroy
        redirect_to users_tweets_timeline_path, notice: "tweet was successfully deleted."
    end

    #GET /users//tweets/timeline
    def timeline
        follows = Follow.where(user_id: current_user.id)
        follower_user_ids = follows.pluck(:target_user_id)
        follower_user_ids.push(current_user.id)
        @tweets = Tweet.where(user_id: follower_user_ids)
        @users = User.all
        @replies = Reply.all
    end

    private
    def tweet_params
        params.require(:tweet).permit(:text, :image, :privacy_status).merge(user_id: params[:user_id]) 
    end

end
