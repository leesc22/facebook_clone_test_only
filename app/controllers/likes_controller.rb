class LikesController < ApplicationController
	def create
		status_id = params[:like][:status]
		user_id = params[:like][:user]
		@like = Like.new(:status_id => status_id, :user_id => user_id)
		@status = @like.status
		unless liked?(status_id, user_id)
			@like.save
			flash[:notice] = "You liked #{@status.title}!"
			redirect_to root_path
		else
			flash[:alert] = "You liked before!"
			redirect_to root_path
		end
	end

	def destroy
		@like = Like.find(params[:id])
		@status = @like.status
		@like.destroy
		flash[:notice] = "You unlike."
		redirect_to @status
	end

	def liked?(status_id, user_id)
		Like.find_by(status_id: status_id, user_id: user_id)
	end
end
