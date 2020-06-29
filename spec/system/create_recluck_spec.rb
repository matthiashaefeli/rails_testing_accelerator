require 'rails_helper'

RSpec.describe 'Reclucking', type: :system do
  context 'user is signed in' do    
    before do
      @me = FactoryBot.create(:user)
      login_as(@me)
    end

    context 'cluck has not been reclucked' do
      it 'can be reclucked' do
        other_user = FactoryBot.create(:user)
        cluck = FactoryBot.create(:cluck, user: other_user)

        visit user_clucks_path(other_user)
        click_on 'Recluck'

        expect(page).to have_content(@me.email)
        expect(page).to have_content(cluck.content)
      end
    end

    context 'cluck has already been reclucked' do
      it 'does not have a recluck link' do
        other_user = FactoryBot.create(:user)
        cluck = FactoryBot.create(:cluck, user: other_user)
        FactoryBot.create(:recluck, cluck: cluck, user: @me)

        visit user_clucks_path(other_user)
        expect(page).not_to have_content('Recluck')
      end
    end
  end

  context 'not signed in' do
    it 'does not show the recluck link' do
      cluck = FactoryBot.create(:cluck)
      visit user_clucks_path(cluck.user)
      expect(page).not_to have_content('Recluck')
    end
  end
end
