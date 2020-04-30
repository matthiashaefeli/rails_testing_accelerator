require 'rails_helper'

RSpec.describe 'Sign in', type: :system do
  it 'works' do
    user = FactoryBot.create(:user)

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on "Log in"
    expect(page).to have_content('Sign out')
  end
end
