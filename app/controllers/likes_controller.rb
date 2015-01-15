class LikesController < ApplicationController

	def index
		redirect_to '/'
	end

	def create
		@photo = Photo.find(params[:photo_id])
		@post.likes.create
		redirect_to '/'
	end

end
