class UsersController < ApplicationController
    
    #GET /users/serach
    def search
        @users = User.search(params[:search])
        pp(params[:search])
        pp(@users)
    end
    
    #GET /users/:id
    def show
        @user = User.find(params[:id])
        if !user_signed_in?
            @tweets = Tweet.where(user_id: @user).everyone
        elsif current_user.id == @user.id
            @tweets = Tweet.where(user_id: @user)
        elsif Follow.where(target_user_id: params[:id], user_id: current_user.id)
        #elsif !Follow.where(target_user_id: params[:id]).pluck(:user_id).include?(current_user.id)
            @tweets = Tweet.where(user_id: @user).everyone
        else
            @tweets = Tweet.where(user_id: @user).everyone.or(Tweet.where(user_id: @user).followers)            
        end
        my_tweet_id = @tweets.pluck(:id)
        @replies = Reply.where(tweet_id: my_tweet_id)
        @images = Image.where(tweet_id: my_tweet_id)
    end

    #GET /users/:id/edit
    def edit
        @user = User.find(params[:id])
    end

    #PATCH /users/:id
    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to user_path(@user), notice: "Your profile was successfully updated."
        else
            render :edit
        end
    end

    private
    def user_params
        params.require(:user).permit(:name,:image)
    end

end
