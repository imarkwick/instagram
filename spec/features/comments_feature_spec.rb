require 'rails_helper'
require_relative 'helpers/application'

include ApplicationHelper

feature 'commenting' do 

	before do
		# sign_up
		create_photo
	end
	
	scenario 'allows users to leave a comment' do
		visit '/photos'
		click_link 'Leave comment', match: :first
		fill_in 'Comment', with: "yo"
		click_button 'Post comment'

		expect(current_path).to eq '/photos'
		expect(page).to have_content
	end

end
