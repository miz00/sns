# frozen_string_literal: true

class FavsController < ApplicationController
  # POST /users/:user_id/tweets/:tweet_id/favs
  def create
    @fav = Fav.create(user_id: current_user.id, tweet_id: params[:tweet_id])
    notification = Notification.create!(user_id: current_user.id, target_tweet_user_id: @fav.tweet.user_id)
    NotificationFav.create!(notification_id: notification.id, fav_id: @fav.id)
    redirect_to users_tweets_timeline_path
  end

  # DELETE /users/:user_id/tweets/:tweet_id/favs/:id
  def destroy
    @fav = Fav.find(params[:id])
    @fav.destroy
    redirect_to users_tweets_timeline_path
  end
end
