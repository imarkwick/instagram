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
			expect(page).to have_content('Add photo')
			# expect(page).to have_content('img_url')
			expect(page).not_to have_content('No photos')
		end
	end

	context 'adding photos' do
		scenario 'prompts user to add img url and comment, then displays it' do
			visit '/photos'
			click_link 'Add photo'
			fill_in 'Picture', with: 'img_url'
			# attach_file 'Photo', Rails.root.join('img_url.jpg')
			click_button 'Create Photo'
			expect(page).to have_content('Add photo')
			# expect(page).to have_css 'img.img_url'
			expect(current_path).to eq '/photos'
		end
	end

	context 'viewing photos' do

		let!(:pic){Photo.create(picture: 'img_url')}

		scenario 'lets a user view a photo' do
			visit '/photos'
			click_link 'pic'
			expect(page).to have_content 'img_url'
			expect(current_path).to eq "/photos/#{pic.id}"
		end
	end
end
