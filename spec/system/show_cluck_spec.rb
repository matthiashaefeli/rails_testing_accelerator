require 'rails_helper'

RSpec.describe 'Show clucks', type: :system do

  before(:each) do
    @user = FactoryBot.create(:user)
    @user_two = FactoryBot.create(:user)
    cluck =  FactoryBot.create(:cluck, user: @user)
    cluck_two = FactoryBot.create(:cluck, user: @user_two)
    login_as(FactoryBot.create(:user))
  end

  it 'shows clucks of specific user' do
    visit users_cluck_path(@user)
    expect(page).to have_content(@user.email, count: 1)
  end

  it 'should not show clucks of other users' do
    visit users_cluck_path(@user)
    expect(page).not_to have_content(@user_two.email)
  end
end