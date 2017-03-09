require 'rails_helper'

feature 'User logging out of the app' do
  let(:user) { create(:user) }

  before do
    visit root_path

    within('nav') { click_on 'Log In' }

    within('form') do
      fill_in 'Username', with: user.username
      fill_in 'Password', with: user.password
      click_on 'Log In'
    end
  end

  scenario 'sees a link to log in' do
    click_on 'Log Out'

    expect(page).to have_link 'Log In', href: login_path
  end

  scenario 'is taken to the root page' do
    click_on 'Log Out'

    expect(current_path).to eq root_path
  end
end
