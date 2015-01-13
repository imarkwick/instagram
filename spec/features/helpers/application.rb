module ApplicationHelper

	def create_photo
		visit '/photos'
		click_link 'Add photo'
		attach_file('photo[picture]', 'spec/features/test_img.jpg')
		fill_in 'Comment', with: 'Title comment'
		click_button 'Create Photo'
	end

	def sign_up
		visit '/'
		click_link('Sign up')
		fill_in('Email', with: 'test@example.com')
		fill_in('Password', with: 'testtest')
		fill_in('Password confirmation', with: 'testtest')
		click_button('Sign up')
	end
end
