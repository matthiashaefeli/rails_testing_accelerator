require 'rails_helper'

RSpec.describe 'Liking', type: :system do
  before do
    @me = FactoryBot.create(:user)
    login_as(@me)
  end

  context 'cluck has not been liked' do
    it 'can be liked' do
      other_user = FactoryBot.create(:user)
      FactoryBot.create(:cluck, user: other_user)

      visit user_clucks_path(other_user)
      expect(page).not_to have_content('1 like')
      click_on 'Like'
      expect(page).to have_content('1 like')
    end
  end

  context 'cluck has already been liked' do
    it 'does not have a like link' do
      other_user = FactoryBot.create(:user)
      cluck = FactoryBot.create(:cluck, user: other_user)
      FactoryBot.create(:like, cluck: cluck, user: @me)

      visit user_clucks_path(other_user)
      expect(page).not_to have_content('Like')
    end
  end
end
