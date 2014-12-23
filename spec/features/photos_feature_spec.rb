require 'rails_helper'

feature 'photos' do 

	context 'no photos have been added' do
		scenario 'should display a prompt to add a photo' do
			visit '/photos'
			expect(page).to have_content 'No photos'
			expect(page).to have_link 'Add photo'
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