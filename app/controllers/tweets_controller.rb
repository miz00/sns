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
    end

    #GET /users/1/tweets/:id
    # def show
    # end

    #DELETE /users/1/tweets/:id
    def destroy
        @tweet = Tweet.find(params[:id])
        @tweet.destroy
        redirect_to user_path(current_user), notice: "tweet was successfully deleted."
    end

    #GET /users//tweets/timeline
    def timeline
        @tweet = Tweet.all
        @user = User.all
    end

    private
    def tweet_params
        params.require(:tweet).permit(:text, :privacy_status).merge(user_id: params[:user_id]) 
    end

end
