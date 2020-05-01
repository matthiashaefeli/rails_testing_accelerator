require 'rails_helper'

RSpec.describe 'Creating a cluck', type: :system do
  it 'works' do
    login_as(FactoryBot.create(:user))
    visit new_cluck_path
    fill_in 'Content', with: 'Hello'
    click_on 'Create Cluck'
    expect(page).to have_content('Hello')
  end
end
