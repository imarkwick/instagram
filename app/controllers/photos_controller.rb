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
	# 	else
	# 	 render '/photos/new'
	# 	end
	end

	def photo_params
		params.require(:photo).permit(:picture, :comment)
	end

	# def show
	# 	@photo = Photo.find(params[:id])
	# end
end
