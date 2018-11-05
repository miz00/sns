class UsersController < ApplicationController
    #GET /users/:id
    def show
        @user = User.find(params[:id])
        @tweets = Tweet.where(params[:user_id])
    end
end
