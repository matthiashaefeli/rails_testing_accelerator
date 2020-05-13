require 'rails_helper'

RSpec.describe "Viewing a user's profile", type: :system do
  it "only shows that user's clucks" do
    my_cluck = FactoryBot.create(:cluck)
    other_user_cluck = FactoryBot.create(:cluck)

    visit user_clucks_path(my_cluck.user)
    expect(page).to have_content(my_cluck.content)
    expect(page).not_to have_content(other_user_cluck.content)
  end
end
