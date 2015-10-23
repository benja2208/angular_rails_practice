class UsersController < ApplicationController
	before_action :logged_in_user, only: [:following, :followers]

	def show
		@user = User.find(params[:id])
	end

	def index 
		@users = User.all 
	end

	def following 
		@title = "Following"
		render 'show_follow'
		@users = @user.following.paginate(page: params[:page])
	end 

	def followers
    @title = "Followers"
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
	end 
end
