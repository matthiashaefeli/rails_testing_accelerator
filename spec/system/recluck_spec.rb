require 'rails_helper'

RSpec.describe 'recluck', type: :system do
  context 'recluck button' do
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
  end

  context 'creat recluck' do
    it 'click on recluck on somebody elses cluck shows cluck in my profile' do
      cluck = FactoryBot.create(:cluck)
      user = FactoryBot.create(:user)
      login_as(user)
      visit clucks_path
      click_on 'Recluck'
      visit users_cluck_path(user)
      expect(page).to have_content(cluck.user.email)
    end
  end

  context 'undo recluck' do
    it 'shows a undo recluck link on my profile' do
      recluck = FactoryBot.create(:recluck)
      login_as(recluck.user)
      visit users_cluck_path(recluck.user)
      expect(page).to have_content('Undo Recluck')
    end
  end

  context 'delete recluck' do
    it 'delete recluck' do
      recluck = FactoryBot.create(:recluck)
      login_as(recluck.user)
      visit users_cluck_path(recluck.user)
      click_on 'Undo Recluck'
      expect(page).not_to have_content(recluck.cluck.content)
    end
  end

  context 'recluck count' do
    it 'shows nothing if no recluck' do
      cluck = FactoryBot.create(:cluck)
      login_as(FactoryBot.create(:user))
      visit clucks_path
      expect(page).not_to have_content('Recluck 0')
    end

    it 'shows number of reclucks on cluck' do
      cluck = FactoryBot.create(:cluck)
      recluck = FactoryBot.create(:recluck, cluck: cluck)
      login_as(FactoryBot.create(:user))
      visit clucks_path
      expect(page).to have_content('Recluck 1')
    end
  end
end