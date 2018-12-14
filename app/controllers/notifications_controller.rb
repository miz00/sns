class NotificationsController < ApplicationController
  
  #GET users/:user_id/notifications
  def index
    @notifications = Notification.where(user_id: current_user.id)
  end

  #POST users/:user_id/notifications
  def create

  end

  #DELETE users/:user_id/notifications/:id
  def destroy
    notification = Notification.find(params[:id])
    if notification.destroy
      redirect_to user_notifications_path(current_user.id)
    end
  end

end
