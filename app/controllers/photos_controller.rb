class PhotosController < ApplicationController

	before_action :authenticate_user!, :except => [:index, :show]
	before_action :require_permission, :only => [:delete]

	def index
		@photos = Photo.all
		if user_signed_in?
			@user_id = current_user.id
		else
			@user_id = nil
		end
	end

	def new
		@photo = Photo.new
		@user = User.find(current_user.id)
	end

	def find_id
		@photo = Photo.find(params[:id])
	end

	def photo_params
		params.require(:photo).permit(:picture, :comment, :user_id)
	end

	def create
		@photo = Photo.new(photo_params)
		@photo.user_id = current_user.id
		if @photo.save
			redirect_to '/photos'
		else
			render '/photos/new'
		end
	end

	def show
		find_id
	end

	def update
		find_id
		@photo.update(photo_params)
		redirect_to '/photos'
	end

	def destroy
		find_id
		@photo.delete
		flash[:notice] = 'Photo deleted'
		redirect_to '/photos'
	end
end
