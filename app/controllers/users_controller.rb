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
            @tweets = Tweet.where(user_id: @user.id).everyone.order(created_at: :desc)
        elsif current_user.id == @user.id
            @tweets = Tweet.where(user_id: @user.id).order(created_at: :desc)
        elsif Follow.where(target_user_id: params[:id], user_id: current_user.id)
            @tweets = Tweet.where(user_id: @user.id).everyone.order(created_at: :desc)
        else
            @tweets = Tweet.where(user_id: @user.id).everyone.or(Tweet.where(user_id: @user.id).followers).order(created_at: :desc)         
        end
        my_tweet_id = @tweets.pluck(:id)
        @replies = Reply.where(tweet_id: my_tweet_id)
        @images = Image.where(tweet_id: my_tweet_id)
        if user_signed_in? then @follow = Follow.find_by(user_id: current_user.id, target_user_id: params[:id]) end
    end

    #GET /users/:id/edit
    def edit
        @user = User.find(current_user.id)
    end

    #PATCH /users/:id
    def update
        @user = User.find(current_user.id)
        if @user.update(user_params)
            redirect_to user_path(@user), notice: "Your profile was successfully updated."
        else
            render :edit
        end
    end

    def fav(tweet)
        Fav.find_by(tweet_id: tweet.id, user_id: current_user.id)
    end

    helper_method :fav

    private
    def user_params
        params.require(:user).permit(:name,:image)
    end

end
