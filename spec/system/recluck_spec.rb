require 'rails_helper'

RSpec.describe 'recluck', type: :system do


  it 'has a recluck botton only on other clucks' do
    user = FactoryBot.create(:user)
    cluck = FactoryBot.create(:cluck, user: user)
    login_as(FactoryBot.create(:user))
    visit clucks_path
    expect(page).to have_content('Recluck')
  end

  it 'has no recluck botton if its my cluck' do
    cluck = FactoryBot.create(:cluck)
    login_as(cluck.user)
    visit clucks_path
    expect(page).not_to have_content('Recluck')
  end
end