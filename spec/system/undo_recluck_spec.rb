require 'rails_helper'

RSpec.describe 'Reclucking', type: :system do
  before do
    @me = FactoryBot.create(:user)
    login_as(@me)
  end

  it 'takes away the recluck' do
    other_user = FactoryBot.create(:user)
    cluck = FactoryBot.create(:cluck, user: other_user)
    FactoryBot.create(:recluck, cluck: cluck, user: @me)

    visit user_clucks_path(other_user)
    click_on 'Undo recluck'
    expect(page).to have_content(@me.email)
    expect(page).not_to have_content(cluck.content)
  end
end
