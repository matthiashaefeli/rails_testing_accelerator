require 'rails_helper'

RSpec.describe 'cluck', type: :system do
  let!(:user) { FactoryBot.create(:user) }

  describe 'create cluck' do
    before(:each) do
      login_as(FactoryBot.create(:user))
   end

    it 'successfully creates a new cluck' do
      visit clucks_path
      click_on 'New Cluck'
      fill_in 'Content', with: 'test cluck'
      click_button 'Create Cluck'
      expect(page).to have_text('Cluck was successfully created')
    end

    it "can't create cluck with empty content" do
      visit clucks_path
      click_on 'New Cluck'
      fill_in 'Content', with: ''
      click_button 'Create Cluck'
      expect(page).to have_text("Content can't be blank")
    end
  end
end