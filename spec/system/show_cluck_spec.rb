require 'rails_helper'

RSpec.describe 'Show clucks', type: :system do

  before(:each) do
    @cluck =  FactoryBot.create(:cluck)
    @cluck_two = FactoryBot.create(:cluck)
    login_as(FactoryBot.create(:user))
  end

  it 'shows clucks of specific user' do
    visit users_cluck_path(@cluck.user)
    expect(page).to have_content(@cluck.user.email, count: 1)
  end

  it 'should not show clucks of other users' do
    visit users_cluck_path(@cluck.user)
    expect(page).not_to have_content(@cluck_two.content)
  end
end