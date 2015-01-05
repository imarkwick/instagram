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
		scenario 'displays photos' do
			create_photo
			visit '/photos'
			expect(page).to have_css("img[src*='test_img.jpg']")
			expect(page).not_to have_content('No photos')
		end
	end

	context 'adding photos' do
		scenario 'prompts user to add img url and comment, then displays it' do
			create_photo
			expect(current_path).to eq '/photos'
			expect(page).to have_css("img[src*='test_img.jpg']")
		end
	end

	context 'viewing photos' do
		scenario 'lets a user view a photo' do
			create_photo
			visit '/photos'
			find('.photos').click
			expect(page).to have_css("img[src*='test_img.jpg']")
		end
	end
end
