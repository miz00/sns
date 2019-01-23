# frozen_string_literal: true

class FollowsController < ApplicationController
  # POST users/:user_id/follows
  def create
    begin
      Follow.create!(user_id: current_user.id, target_user_id: params[:user_id])
      redirect_to user_path(params[:user_id])
    rescue => e
      #render :text => e.message
      redirect_to user_path(params[:user_id]), alert: "follow was not complete. error: #{e.message}"
    end
  end

  # DELETE users/:user_id/follows/:id
  def destroy
    begin
      follow = Follow.find(params[:id])
      follow.destroy
      redirect_to user_path(params[:user_id])
    rescue => e
      redirect_to user_path(params[:user_id]), alert: "unfollow was not complete. error: #{e.message}"
    end
  end
end
