class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.authenticate(params[:session])
		if user 
			session[:user_id] = user.id
			flash[:notice] = "Welcome, #{user.email}!"
			redirect_to statuses_path
		else
			flash[:alert] = "Please log in again"
			render 'new'
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_path
	end
end
