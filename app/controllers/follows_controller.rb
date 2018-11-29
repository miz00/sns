class FollowsController < ApplicationController

	# POST users/:user_id/follows
		def create
			Follow.create(user_id: current_user.id, target_user_id: params[:user_id])
			redirect_to user_path(params[:user_id])
		end

	# DELETE users/:user_id/follows/:id
		def destroy
			follow = Follow.find_by(params[:id])
			follow.destroy
			redirect_to user_path(params[:user_id])
		end

	end
