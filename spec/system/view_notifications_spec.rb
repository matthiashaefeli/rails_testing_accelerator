require 'rails_helper'

RSpec.describe 'viewing notification', type: :system do
  before do
    @me = FactoryBot.create(:user)
    login_as(@me)
  end

  context 'another user likes my cluck' do
    it 'shows notification' do
      cluck = FactoryBot.create(:cluck, user: @me)
      like = FactoryBot.create(:like, cluck: cluck)
      visit notifications_path
      expect(page).to have_content("#{like.user} liked #{cluck.content}")
    end
  end

end