require 'rails_helper'

feature 'photos' do 

	context 'no photos have been added' do
		scenario 'should display a prompt to add a photo' do
			visit '/photos'
			expect(page).to have_link 'Add photo'
		end
	end


	context 'photos have been added' do

		before do
			Photo.create(picture: 'test_img.jpg')
		end

		scenario 'displays photos' do
			visit '/photos'
			expect(page).to have_css("img[src*='test_img.jpg']")
			expect(page).not_to have_content('No photos')
		end
	end

	context 'adding photos' do
		scenario 'prompts user to add img url and comment, then displays it' do
			visit '/photos'
			click_link 'Add photo'
			attach_file('photo[picture]', 'spec/features/test_img.jpg')
			click_button 'Create Photo'
			expect(current_path).to eq '/photos'
			expect(page).to have_css("img[src*='test_img.jpg']")
		end
	end

	# context 'viewing photos' do

	# 	scenario 'lets a user view a photo' do
	# 		visit '/photos'
	# 		click_link 'pic'
	# 		expect(page).to have_content 'img_url'
	# 		expect(current_path).to eq "/photos/#{pic.id}"
	# 	end
	# end
end
