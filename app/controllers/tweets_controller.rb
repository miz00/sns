# frozen_string_literal: true

class TweetsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create timeline]

  # GET /users/1/tweets
  # def index
  # end

  # POST /users/1/tweets
  def create
    ActiveRecord::Base.transaction do
      @tweet = Tweet.create!(tweet_params)
      if image_params1 then @image = Image.create!(image: params[:tweet][:image1], tweet_id: image_params1[:tweet_id]) end
      if image_params2 then @image = Image.create!(image: params[:tweet][:image2], tweet_id: image_params2[:tweet_id]) end
      if image_params3 then @image = Image.create!(image: params[:tweet][:image3], tweet_id: image_params3[:tweet_id]) end
    # add user_icon_url into JSON response
      image_url = if @tweet.user.image
                    '/uploads/store/' + @tweet.user.image.id
                  else
                    '/uploads/store/default_icon.jpg'
                  end
      # make JSON response data
      json_hash = { id: @tweet.id, user_id: @tweet.user_id, text: @tweet.text, privacy_status: @tweet.privacy_status,
                    created_at: @tweet.created_at, image_url: image_url, user_name: @tweet.user.name }
    end
      respond_to do |format|        
        format.html { redirect_to user_path(current_user), notice: 'tweet was successfully created.' }
        format.json { render json: json_hash }
      end
    rescue ActiveRecord::RecordInvalid => e
      respond_to do |format|
        format.html { render action: :timeline }
        format.json { render json: 'error' }
      end
  end

  # GET /users/1/tweets/new
  def new
    @tweets = Tweet.new
    @users = current_user
  end

  # GET /users/1/tweets/:id
  def show
    @tweet = Tweet.find(params[:id])
  end

  # DELETE /users/1/tweets/:id
  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to users_tweets_timeline_path, notice: 'tweet was successfully deleted.'
  end

  # GET /users//tweets/timeline
  def timeline
    follows = Follow.where(user_id: current_user.id)
    follower_user_ids = follows.pluck(:target_user_id)
    follower_user_ids.push(current_user.id)
    tweets = Tweet.where(user_id: follower_user_ids).order(created_at: :desc).includes(:favs,:images,:replies,:user)
    @tweets = Tweet.except_reply_tweets(tweets)

    # For added ajax form
    @tweet = Tweet.new
  end

    private

  def tweet_params
    params.require(:tweet).permit(:text, :privacy_status).merge(user_id: current_user.id)
  end

  def image_params1
    if params[:tweet][:image1]
      params.require(:tweet).permit(:image1).merge(tweet_id: @tweet.id)
    end
  end

  def image_params2
    if params[:tweet][:image2]
      params.require(:tweet).permit(:image2).merge(tweet_id: @tweet.id)
    end
  end

  def image_params3
    if params[:tweet][:image3]
      params.require(:tweet).permit(:image3).merge(tweet_id: @tweet.id)
    end
  end
  end
