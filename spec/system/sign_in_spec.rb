require 'rails_helper'

RSpec.describe 'Sign In', type: :system do
  let!(:user) { FactoryBot.create(:user) }

  describe 'sign in' do
    it 'successfully sign in a user' do
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
      expect(page).to have_link 'Sign out'
    end

    it 'cant sign in' do
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: '1234'
      click_button 'Log in'
      expect(page).to have_text 'Invalid Email or password.'
    end
  end
end