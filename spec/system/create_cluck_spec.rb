require 'rails_helper'

RSpec.describe 'Creating a cluck', type: :system do
  context 'signed in' do
    before do
      login_as(FactoryBot.create(:user))
    end

    context 'valid cluck' do
      before do
        visit new_cluck_path
        fill_in 'Content', with: 'Hello world with 8 words test for tests'
        click_on 'Create Cluck'
      end

      it 'works' do
        expect(page).to have_content('Hello world with 8 words test for tests')
      end

      describe 'confirmation message' do
        it 'shows the message only once' do
          expect(page).to have_content('Cluck was successfully created', count: 1)
        end
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
