class UsersController < ApplicationController
	before_action :logged_in_user, only: [:following, :followers]

	def show
		@user = User.find(params[:id])
	end

	def index 
		@users = User.all 
	end

	def logged_in_user
    unless user_signed_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

	def following 
		@title = "Following"
		@user  = User.find(params[:id])
		@users = @user.following.paginate(page: params[:page])
		render 'show_follow'
	end 

	def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
	end 
end
