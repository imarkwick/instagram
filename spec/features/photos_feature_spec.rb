require 'rails_helper'

feature 'photos' do 

	context 'no photos have been added' do
		scenario 'should display a prompt to add a photo' do
			visit '/photos'
			expect(page).to have_content 'No photos'
			expect(page).to have_link 'Add photo'
		end
	end

	context 'adding photos' do
		scenario 'prompts user to add img url and coomment, then displays it' do
			visit '/photos'
			click_link 'Add photo'
			# fill_in 'Photo', with: 'img_url'
			attach_file('img_url', '../helpers/upload_photo.jpg')
			click_button 'Add'
			expect(page).to have_content('img_url')
			expect(current_path).to eq '/photos'
		end
	end

	context 'photos have been added' do
		before do
			Photo.create(picture: 'img_url')
		end

		scenario 'displays photos' do
			visit '/photos'
			expect(page).to have_content('img_url')
			expect(page).not_to have_content('No photos')
		end
	end
end