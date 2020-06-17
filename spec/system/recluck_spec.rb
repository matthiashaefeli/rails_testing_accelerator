require 'rails_helper'

RSpec.describe 'recluck', type: :system do

  it 'has a recluck botton only on other clucks' do
    cluck = FactoryBot.create(:cluck)
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

  it 'click on recluck on somebody elses cluck shows cluck in my profile' do
    cluck = FactoryBot.create(:cluck)
    user = FactoryBot.create(:user)
    login_as(user)
    visit clucks_path
    click_on 'Recluck'
    visit users_cluck_path(user)
    expect(page).to have_content(cluck.user.email)
  end

  it 'shows a undo recluck link on my profile' do
    recluck = FactoryBot.create(:recluck, user: FactoryBot.create(:user))
    login_as(recluck.user)
    visit users_cluck_path(recluck.user)
    expect(page).to have_content('Undo Recluck')
  end

  it 'delete recluck' do
    recluck = FactoryBot.create(:recluck, user: FactoryBot.create(:user))
    login_as(recluck.user)
    visit users_cluck_path(recluck.user)
    click_on 'Undo Recluck'
    expect(page).not_to have_content(recluck.cluck.content)
  end
end