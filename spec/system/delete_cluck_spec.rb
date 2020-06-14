require 'rails_helper'

RSpec.describe 'Delete cluck', type: :system do

  it 'deletes my own cluck successfully' do
    cluck = FactoryBot.create(:cluck)
    login_as(cluck.user)
    visit clucks_path
    expect(page).to have_content(cluck.content)
    accept_alert do
      click_on 'Destroy'
    end
    expect(page).not_to have_content(cluck.content)
  end

  it 'does not show a delete link' do
    cluck = FactoryBot.create(:cluck)
    login_as(FactoryBot.create(:user))
    visit clucks_path
    expect(page).to have_content(cluck.content)
    expect(page).not_to have_content('Destroy')
  end

end