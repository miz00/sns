class TweetsController < ApplicationController
    before_action :authenticate_user!, only: [:timeline, :new, :create]

    #GET /users/1/tweets
    def index

    end

    #POST /users/1/tweets
    def create

    end

    #GET /users/1/tweets/new
    def new
        
    end

    #GET /users/1/tweets/:id
    def show

    end

    #DELETE /users/1/tweets/:id
    def destroy

    end

    #GET /users/1/tweets/timeline
    def timeline
        
    end

end
