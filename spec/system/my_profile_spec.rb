require 'rails_helper'

RSpec.describe 'my profile', type: :system do
  before(:each) do
    @cluck = FactoryBot.create(:cluck)
    @cluck_other_user = FactoryBot.create(:cluck)
    login_as(FactoryBot.create(:user))
  end

  it 'has a link on the index page to my profile' do
    visit clucks_path
    expect(page).to have_content('My Profile')
  end

  it 'shows my clucks only on the my profile page' do
    visit clucks_path
    click_on 'My Profile'
    expect(page).not_to have_content(@cluck_other_user.content)
  end
end