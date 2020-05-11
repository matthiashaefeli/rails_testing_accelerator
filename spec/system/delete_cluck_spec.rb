require 'rails_helper'

RSpec.describe 'Deleting a cluck', type: :system do
  context 'deleting my own cluck' do
    it 'works' do
      cluck = FactoryBot.create(:cluck)

      login_as(cluck.user)
      visit clucks_path
      expect(page).to have_content(cluck.content)

      accept_alert do
        click_on 'Destroy'
      end

      expect(page).not_to have_content(cluck.content)
    end
  end

  context "attempting to delete someone else's cluck" do
    it 'does not let me delete the cluck' do
      cluck = FactoryBot.create(:cluck)
      other_user_cluck = FactoryBot.create(:cluck)

      login_as(cluck.user)
      visit clucks_path
      expect(page).to have_content(other_user_cluck.content)
      expect(page).to have_content('Destroy', count: 1)
    end
  end
end
