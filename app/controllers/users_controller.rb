class UsersController < ApplicationController
    
    #GET /users/serach
    def search
    end
    
    #GET /users/:id
    def show
        @user = User.find(params[:id])
        @tweets = Tweet.where(user_id: @user)
    end

    
end
