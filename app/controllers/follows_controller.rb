class FollowsController < ApplicationController

	# POST users/:user_id/follows
		def create
			ActiveRecord::Base.transaction do
				Follow.create!(user_id: current_user.id, target_user_id: params[:user_id])
			end
				redirect_to user_path(params[:user_id])
			rescue => e
				render :text => e.message
		end

	# DELETE users/:user_id/follows/:id
		def destroy
			follow = Follow.find_by(params[:id]) #other user can delete
			#error handling
			follow.destroy
			redirect_to user_path(params[:user_id])
		end

	end
