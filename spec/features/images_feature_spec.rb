require 'rails_helper'

feature 'photos' do 

	context 'no photos have been added' do
		scenario 'should display a prompt to add a photo' do
			visit '/photos'
			expect(page).to have_content 'No photos'
			expect(page).to have_link 'Add photo'
		end
	end
end