class FavsController < ApplicationController

    # POST /users/:user_id/tweets/:tweet_id/favs
    def create
      @fav = Fav.create(user_id: current_user.id, tweet_id: params[:tweet_id])  
    end

    # DELETE /users/:user_id/tweets/:tweet_id/favs/:id
    def destroy
      @fav = Fav.find(tweet_id: params[tweet_id])
      @fav.destroy
    end

end
