class TweetsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :timeline]

  #GET /users/1/tweets
  # def index
  # end

  #POST /users/1/tweets
  def create
    pp("in Tweet#create")
    @tweet = Tweet.create(tweet_params)
    if image_params1 then @image = Image.create(image: image_params1[:image1], tweet_id: image_params1[:tweet_id]) end
    if image_params2 then @image = Image.create(image: image_params2[:image2], tweet_id: image_params2[:tweet_id]) end
    if image_params3 then @image = Image.create(image: image_params3[:image3], tweet_id: image_params3[:tweet_id]) end
      respond_to do |format|
        p @tweet
        p format
        if @tweet
          format.html {redirect_to user_path(current_user), notice: "tweet was successfully created."}
          format.json { render json: @tweet }
          #redirect_to user_path(current_user), notice: "tweet was successfully created."
          #render json: @tweet
        else
          #redirect_to new_user_tweet_path(current_user), notice: "tweet was not created."
          format.html {redirect_to new_user_tweet_path(current_user), notice: "tweet was not created."}
          format.json { render json: "error????" }
        end
      end
  end

  #GET /users/1/tweets/new
  def new
    @tweets = Tweet.new
    @users = current_user
    @path = Rails.application.routes.recognize_path(request.referer)
  end

  #GET /users/1/tweets/:id
  # def show
  # end

  #DELETE /users/1/tweets/:id
  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to users_tweets_timeline_path, notice: "tweet was successfully deleted."
  end

  #GET /users//tweets/timeline
  def timeline
    follows = Follow.where(user_id: current_user.id)
    follower_user_ids = follows.pluck(:target_user_id)
    follower_user_ids.push(current_user.id)
    @tweets = Tweet.where(user_id: follower_user_ids).order(created_at: :desc)
    @tweets = Tweet.except_reply_tweets(@tweets)
    @users = User.all
    @replies = Reply.all
    # For added ajax form
    @tweet = Tweet.new
  end

  # enable_to_see?(t,current_user)
  def enable_to_see?(tweet,current_user)
    false
    if tweet.user_id != current_user.id && tweet.privacy_status == "me"
      true
    end
  end

  helper_method :enable_to_see?

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
