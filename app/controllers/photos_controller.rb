class PhotosController < ApplicationController

	def index
		@photos = Photo.all
	end

	def new
		@photo = Photo.new
	end

	def create
		@photo = Photo.new(photo_params)
		@photo.save
		redirect_to '/photos'
		# else
		#   render '/photos/new'
		# end
	end

	def photo_params
		params.require(:photo).permit(:picture)
	end

	def show
		@photo = Photo.find(params[:id])
	end

	def update
		@photo = Photo.find(params[:id])
		@photo.update(photo_params)
		redirect_to '/photos'
	end

	def destroy
		@photo = Photo.find(params[:id])
		@photo.delete
		flash[:notice] = 'Photo deleted'
		redirect_to '/photos'
	end
end
