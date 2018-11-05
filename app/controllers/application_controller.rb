class ApplicationController < ActionController::Base
  def after_sign_out_path_for(resource) 
    new_user_session_path
  end

  def after_sign_in_path_for(resource) 
    current_user.admin_check ? admin_users_path : users_tweets_timeline_path
  end
end