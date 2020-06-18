require 'rails_helper'

RSpec.describe 'likes', type: :system do
  context 'likes count' do
    it 'shows nothing if there are no likes' do
      cluck = FactoryBot.create(:cluck)
      login_as(FactoryBot.create(:user))
      visit clucks_path
      expect(page).not_to have_content('Likes 0')
    end

    it 'shows number of likes' do
      cluck = FactoryBot.create(:cluck)
      like = FactoryBot.create(:like, cluck: cluck)
      login_as(FactoryBot.create(:user))
      visit clucks_path
      expect(page).to have_content('Likes 1')
    end
  end

  context 'create like' do
    it 'create new like' do
      cluck = FactoryBot.create(:cluck)
      login_as(FactoryBot.create(:user))
      visit clucks_path
      click_on 'Likes'
      expect(page).to have_content('Likes 1')
    end
  end
end