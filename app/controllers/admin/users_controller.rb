class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_check

  #GET /admin/users
  def index
    @users = User.all
  end

  #GET /admin/users/:id
  def show
    @user = User.find(params[:id])
  end

  private
  def admin_check
    return redirect_to users_tweets_timeline_path, :notice => "unauthorized access is prohibited." unless current_user.admin_check
  end
end
