require 'rails_helper'

feature 'Logged in user adding a topic', js: true do
  let(:user) { create(:user) }

  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  scenario 'sees the topic name with 1 vote' do
    visit week_six_path

    fill_in 'Topic Name', with: 'ActiveRecord'
    click_on 'Add Topic'

    within '#suggested-topics' do
      expect(page).to have_content 'ActiveRecord (1 vote)'
    end
  end
end
