require 'rails_helper'

RSpec.describe 'Reclucking', type: :system do
  before do
    login_as(FactoryBot.create(:user))
  end

  context 'cluck has not been reclucked' do
    it 'can be reclucked' do
      cluck = FactoryBot.create(:cluck)

      visit user_clucks_path(cluck.user)

      expect(page).not_to have_content('0 reclucks')
    end
  end

  context 'cluck has been reclucked' do
    it 'can be reclucked' do
      cluck = FactoryBot.create(:cluck)
      FactoryBot.create(:recluck, cluck: cluck)

      visit user_clucks_path(cluck.user)

      expect(page).to have_content('1 recluck')
    end
  end
end
