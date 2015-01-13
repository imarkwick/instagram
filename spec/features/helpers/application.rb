module ApplicationHelper

	def create_photo
		visit '/photos'
		click_link 'Add photo'
		attach_file('photo[picture]', 'spec/features/test_img.jpg')
		fill_in 'Comment', with: 'Title comment'
		click_button 'Create Photo'
	end
end
