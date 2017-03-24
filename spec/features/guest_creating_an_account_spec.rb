require 'rails_helper'

feature 'Guest creating an account' do
  let!(:cohort) { create(:cohort, name: '1510 Backend') }

  context 'when username is already taken' do
    before { create(:user, username: 'tonirib', cohort: cohort) }

    scenario 'sees an error message' do
      visit new_user_path

      fill_in 'First name', with: 'Toni'
      fill_in 'Last name', with: 'Rib'
      fill_in 'Username', with: 'tonirib'
      fill_in 'Email', with: 'toni@test.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      select '1510 Backend', from: 'user_cohort_id'
      click_on 'Create User'

      expect(page).to have_content 'Username has already been taken'
    end
  end

  context 'when email is already taken' do
    before { create(:user, email: 'alreadytaken@taken.com', cohort: cohort) }

    scenario 'sees an error message' do
      visit new_user_path

      fill_in 'First name', with: 'Toni'
      fill_in 'Last name', with: 'Rib'
      fill_in 'Username', with: 'tonitest'
      fill_in 'Email', with: 'alreadytaken@taken.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      select '1510 Backend', from: 'user_cohort_id'
      click_on 'Create User'

      expect(page).to have_content 'Email has already been taken'
    end
  end

  context 'when password confirmation does not match password' do
    scenario 'sees an error message' do
      visit new_user_path

      fill_in 'First name', with: 'Toni'
      fill_in 'Last name', with: 'Rib'
      fill_in 'Username', with: 'tonitest'
      fill_in 'Email', with: 'tonitest@test.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'notthesamepassword'
      select '1510 Backend', from: 'user_cohort_id'
      click_on 'Create User'

      expect(page).to have_content "Password confirmation doesn't match Password"
    end
  end

  context 'when password is not at least 8 characters' do
    scenario 'sees an error message' do
      visit new_user_path

      fill_in 'First name', with: 'Toni'
      fill_in 'Last name', with: 'Rib'
      fill_in 'Username', with: 'tonitest'
      fill_in 'Email', with: 'tonitest@test.com'
      fill_in 'Password', with: 'short'
      fill_in 'Password confirmation', with: 'short'
      select '1510 Backend', from: 'user_cohort_id'
      click_on 'Create User'

      expect(page).to have_content 'Password is too short (minimum is 8 characters)'
    end
  end

  context 'when username is not at least 6 characters' do
    scenario 'sees an error message' do
      visit new_user_path

      fill_in 'First name', with: 'Toni'
      fill_in 'Last name', with: 'Rib'
      fill_in 'Username', with: 'short'
      fill_in 'Email', with: 'tonitest@test.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      select '1510 Backend', from: 'user_cohort_id'
      click_on 'Create User'

      expect(page).to have_content 'Username is too short (minimum is 6 characters)'
    end
  end

  context 'when all inputs are valid' do
    scenario 'is logged in and taken to the home page' do
      visit new_user_path

      fill_in 'First name', with: 'Toni'
      fill_in 'Last name', with: 'Rib'
      fill_in 'Username', with: 'tonirib'
      fill_in 'Email', with: 'tonitest@test.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      select '1510 Backend', from: 'user_cohort_id'
      click_on 'Create User'

      expect(page).to have_content 'Log Out'
      expect(current_path).to eq root_path
    end
  end
end
