# frozen_string_literal: true

class NotificationsController < ApplicationController
  # GET users/:user_id/notifications
  def index
    @notifications = Notification.where(user_id: current_user.id)
  end

  # POST users/:user_id/notifications
  def create; end

  # DELETE users/:user_id/notifications/:id
  def destroy
    notification = Notification.find(params[:id])
    redirect_to user_notifications_path(current_user.id) if notification.destroy
  end
end
