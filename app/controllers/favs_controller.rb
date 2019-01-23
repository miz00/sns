# frozen_string_literal: true

class FavsController < ApplicationController
  # POST /users/:user_id/tweets/:tweet_id/favs
  def create
    ActiveRecord::Base.transaction do
      @fav = Fav.create!(user_id: current_user.id, tweet_id: params[:tweet_id])
      notification = Notification.create!(user_id: current_user.id, target_tweet_user_id: @fav.tweet.user_id)
      NotificationFav.create!(notification_id: notification.id, fav_id: @fav.id)
    end
      redirect_to users_tweets_timeline_path
    rescue => e
      redirect_to users_tweets_timeline_path, aleart: e.message
  end

  # DELETE /users/:user_id/tweets/:tweet_id/favs/:id
  def destroy
    @fav = Fav.find(params[:id])
    @fav.destroy
    redirect_to users_tweets_timeline_path
  end
end
