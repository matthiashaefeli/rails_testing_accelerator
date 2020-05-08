require 'rails_helper'

RSpec.describe 'Deleting a cluck', type: :system do
  it 'works' do
    cluck = FactoryBot.create(:cluck)

    visit clucks_path
    expect(page).to have_content(cluck.content)

    accept_alert do
      click_on 'Destroy'
    end

    expect(page).not_to have_content(cluck.content)
  end
end
