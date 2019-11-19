class HomesController < ApplicationController
  def index
  	@user = User.new
  end

  def login

  end

  def check_login
  	user = User.find_by_email(params[:check_login][:email])
		if user.present?
			session[:id] = user.id
			flash[:notice] = "Logged in successfully"
			redirect_to users_path
		else
			flash[:error] = "Email is not registered yet"
			redirect_to new_user_path
		end
  end

  def logout
		if User.find_by_id(session[:id])
			session[:id] = nil
			redirect_to new_user_path, notice: 'Signout Successfully'
		end
	end

end
