require 'rails_helper'
require_relative 'helpers/application'

include ApplicationHelper

feature 'liking' do

	before do
		create_photo
	end

	# scenario 'a photo has no likes when first added' do
	# 	visit '/'
	# 	expect(page).to have_content('0 Likes')
	# end

	# scenario 'user can like a photo, adding to the likes count' do
	# 	visit '/'
	# 	click_link 'Like'
	# 	expect(page).to have_content('1 like')
	# end
	
end