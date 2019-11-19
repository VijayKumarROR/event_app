class UsersController < ApplicationController
	before_action :get_user, only: [:index]
	
	def new
		@user = User.new
	end

	def index
		@events = Event.where(user_id: @user.id)
	end

	def login
		binding.pry
		
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:notice] = "Users successfully saved"
			redirect_to homes_login_path
		else 
			render 'new'
		end
	end

	private
	def user_params
		params.require(:user).permit(:name, :email, :is_admin)
	end

	private

	def get_user
		@user = User.find_by_id(session[:id])
	end

end
