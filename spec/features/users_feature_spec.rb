require 'rails_helper'
require_relative 'helpers/application'

include ApplicationHelper

context 'user not signed in and on the homepage' do 
	it 'should see a "sign in" link and a "sign up" link' do
		visit '/'
		expect(page).to have_link('Sign in')
		expect(page).to have_link('Sign up')
	end

	it 'should not see a "sign out" link' do
		visit '/'
		expect(page).not_to have_link('Sign out')
	end

	it 'should not be able to add a photo' do
		visit '/'
		click_link 'Add photo'
		expect(page).to have_content('You need to sign in or sign up before continuing')
	end
end

context 'user signed in on the homepage' do

	before do
		sign_up
	end

	it 'should see "sign out" link' do
		visit '/'
		expect(page).to have_link('Sign out')
	end

	it 'should not see a "sign in" and "sign up" link' do
		visit '/'
		expect(page).not_to have_link('Sign up')
		expect(page).not_to have_link('Sign in')
	end
end