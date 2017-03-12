require 'rails_helper'

feature 'Logged in user visiting week six lesson vote', js: true do
  let(:user) { create(:user) }
  let(:active_suggestion) { create(:suggested_topic, name: 'Heroku Addons') }
  let(:archived_suggestion) { create(:suggested_topic, name: 'Pair Programming', archived: true) }

  before do
    create(:user_vote, user: user, suggested_topic: active_suggestion)
    create(:user_vote, user: user, suggested_topic: archived_suggestion)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  scenario 'sees the currently submitted, non-archived topics' do
    visit week_six_path

    expect(page).to have_content active_suggestion.name
    expect(page).not_to have_content archived_suggestion.name
  end

  scenario 'sees the number of votes for each topic' do
    visit week_six_path

    within("#voted-lesson-topic-#{active_suggestion.id}") do
      expect(page).to have_content '(1 vote)'
    end
  end

  scenario 'can vote for a topic' do
    visit week_six_path

    within("#voted-lesson-topic-#{active_suggestion.id}") do
      expect(page).to have_css '.upvote'
    end
  end

  scenario 'can add a new topic' do
    visit week_six_path

    within('.add-topic') do
      expect(page).to have_content 'Add Topic'
    end
  end

  scenario 'does not sees a link to log in for voting' do
    visit week_six_path

    within('.add-topic') do
      expect(page).not_to have_link 'Log In', href: login_path
    end
  end
end
