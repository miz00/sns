class FavsController < ApplicationController

    # POST /users/:user_id/tweets/:tweet_id/favs
    def create
      @fav = Fav.create(user_id: current_user.id, tweet_id: params[:tweet_id])  
      redirect_to users_tweets_timeline_path
    end

    # DELETE /users/:user_id/tweets/:tweet_id/favs/:id
    def destroy
      @fav = Fav.find(params[:id])
      @fav.destroy
      redirect_to users_tweets_timeline_path
    end

end
