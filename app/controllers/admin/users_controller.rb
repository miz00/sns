class Admin::UsersController < ApplicationController

    #GET /admin/users
    def index
        @users = User.all
    end

    #GET /admin/users/:id
    def show
        @user = User.find(params[:id])
    end

end
