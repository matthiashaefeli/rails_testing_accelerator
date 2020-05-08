require 'rails_helper'

RSpec.describe 'Creating a cluck', type: :system do
  context 'signed in' do
    before do
      login_as(FactoryBot.create(:user))
    end

    context 'valid cluck' do
      it 'works' do
        visit new_cluck_path
        fill_in 'Content', with: 'Hello'
        click_on 'Create Cluck'
        expect(page).to have_content('Hello')
      end
    end

    context 'blank' do
      it 'gives it a validation error' do
        visit new_cluck_path
        fill_in 'Content', with: ''
        click_on 'Create Cluck'
        expect(page).to have_content("Content can't be blank")
      end
    end
  end

  context 'not signed in' do
    it 'does not let me view the form' do
      visit new_cluck_path
      expect(page).not_to have_content('Content')
    end
  end
end
