require 'rails_helper'

feature 'Guest logging into the app' do
  let!(:user) { create(:user) }

  context 'from the week 6 voting page' do
    scenario 'sees a link to log out' do
      visit week_six_path

      within('.add-topic') { click_on 'Log In' }

      within('form') do
        fill_in 'Username', with: user.username
        fill_in 'Password', with: user.password
        click_on 'Log In'
      end

      expect(page).to have_link 'Log Out', href: logout_path
      expect(current_path).to eq week_six_path
      expect(page).not_to have_content 'Want to add or vote for a topic?'
    end
  end

  context 'from the main page nav bar' do
    scenario 'sees a link to log out' do
      visit root_path

      within('nav') { click_on 'Log In' }

      within('form') do
        fill_in 'Username', with: user.username
        fill_in 'Password', with: user.password
        click_on 'Log In'
      end

      expect(page).to have_link 'Log Out', href: logout_path
      expect(current_path).to eq root_path
    end
  end
end
