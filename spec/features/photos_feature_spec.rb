require 'rails_helper'
require_relative 'helpers/application'

include ApplicationHelper

feature 'photos' do 

	context 'not added yet' do
		scenario 'should display a prompt to add a photo' do
			visit '/photos'
			expect(page).to have_link 'Add photo'
		end

		scenario 'should be able to go to homepage' do
			visit '/'
			expect(page).to have_link 'IZZYGRAM'
		end
	end

	context 'have been added' do
		
		before do
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
			visit '/'
			find('.photos').click
			expect(page).to have_css("img[src*='test_img.jpg']")
			expect(page).to have_content('Title comment')
		end

		scenario 'removes photo when deleted by a user' do
			visit '/photos'
			click_link 'Delete photo', match: :first
			expect(page).to have_content('Photo deleted')
		end

		scenario 'users can\'t delete other people\'s photos' do
			click_link('Sign out')
			visit '/'
			click_link('Sign up')
			fill_in('Email', with: 'secondtest@example.com')
			fill_in('Password', with: 'testtest')
			fill_in('Password confirmation', with: 'testtest')
			click_button('Sign up')
			expect(page).not_to have_link 'Delete photo'
		end
	end
end
