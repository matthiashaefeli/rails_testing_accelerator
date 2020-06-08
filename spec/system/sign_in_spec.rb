require 'rails_helper'

Rspec.describe 'Sign In', type: :system do
  describe 'sign in' do
    it 'successfully sign in a user' do
      visit login page
      fill in email
      fill in password
      click on login button
      check if logged in
    end
  end
end