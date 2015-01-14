require 'rails_helper'
require_relative 'helpers/application'

include ApplicationHelper

feature 'photos' do 

	context 'no photos have been added' do
		scenario 'should display a prompt to add a photo' do
			visit '/photos'
			expect(page).to have_link 'Add photo'
		end
	end

	context 'photos have been added' do
		
		before do
			sign_up
			create_photo
		end

		scenario 'displays photos' do
			visit '/photos'
			expect(page).to have_css("img[src*='test_img.jpg']")
			expect(page).to have_content('Title comment')
			expect(page).not_to have_content('No photos')
		end

		scenario 'adding and displaying photos' do
			expect(current_path).to eq '/photos'
			expect(page).to have_css("img[src*='test_img.jpg']")
			expect(page).to have_content('Title comment')
		end

		scenario 'lets a user view a photo' do
			visit '/photos'
			find('.photos').click
			expect(page).to have_css("img[src*='test_img.jpg']")
			expect(page).to have_content('Title comment')
		end

		scenario 'removes photo when deleted by a user' do
			visit '/photos'
			click_link 'Delete photo', match: :first
			expect(page).to have_content('Photo deleted')
		end
	end
end
