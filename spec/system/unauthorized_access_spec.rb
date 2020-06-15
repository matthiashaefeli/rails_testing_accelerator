require 'rails_helper'

RSpec.describe 'Unauthorized Access', type: :system do
  it 'not access to cluck form if not logged in' do
    visit new_cluck_path
    expect(current_path).to eq(new_user_session_path)
  end

  it 'as logged in user has acces to cluck form' do
    login_as(FactoryBot.create(:user))
    visit new_cluck_path
    expect(current_path).to eq(new_cluck_path)
  end
end