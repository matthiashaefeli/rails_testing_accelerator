require 'rails_helper'

RSpec.describe 'Undo like', type: :system do
  before do
    @me = FactoryBot.create(:user)
    login_as(@me)
  end

  it 'takes away the like' do
    other_user = FactoryBot.create(:user)
    cluck = FactoryBot.create(:cluck, user: other_user)
    FactoryBot.create(:like, cluck: cluck, user: @me)

    visit user_clucks_path(other_user)
    expect(page).to have_content('1 like')
    click_on 'Undo like'
    expect(page).to have_content(other_user.email)
    expect(page).not_to have_content('1 like')
  end
end
