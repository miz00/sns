class TweetsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]

    #GET /users/1/tweets
    # def index
    # end

    #POST /users/1/tweets
    def create
        @tweet = Tweet.new(tweet_params)
        respond_to do |format|
            if @tweet.save
                redirect_to :back, notice: "tweet was successfully created."
            else
                render :new
            end
        end
    end

    #GET /users/1/tweets/new
    def new
        @tweet = Tweet.new
    end

    #GET /users/1/tweets/:id
    # def show
    # end

    #DELETE /users/1/tweets/:id
    def destroy

    end

    #GET /users//tweets/timeline
    def timeline
        
    end

    private
    def tweet_params
        params.require(:tweet).permit(:text, :privacy_status).merge(user_id: current_user.id)
    end
    
end
