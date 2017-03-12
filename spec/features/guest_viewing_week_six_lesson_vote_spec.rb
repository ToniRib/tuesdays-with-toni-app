require 'rails_helper'

feature 'Guest viewing week six lesson vote', type: :feature, js: true do
  let(:user) { create(:user) }
  let(:active_suggestion) { create(:suggested_topic, topic: 'Heroku Addons') }
  let(:archived_suggestion) { create(:suggested_topic, topic: 'Pair Programming', archived: true) }

  before do
    create(:user_vote, user: user, suggested_topic: active_suggestion)
    create(:user_vote, user: user, suggested_topic: archived_suggestion)
  end

  scenario 'sees the currently submitted, non-archived topics' do
    visit week_six_path

    expect(page).to have_content active_suggestion.topic
    expect(page).not_to have_content archived_suggestion.topic
  end

  scenario 'sees the number of votes for each topic' do
    visit week_six_path

    within("#voted-lesson-topic-#{active_suggestion.id}") do
      expect(page).to have_content '(1 vote)'
    end
  end

  scenario 'cannot vote for a topic' do
    visit week_six_path

    within("#voted-lesson-topic-#{active_suggestion.id}") do
      expect(page).not_to have_css '.upvote'
    end
  end

  scenario 'cannot add a new topic' do
    visit week_six_path

    expect(page).not_to have_content 'Add Topic'
  end

  scenario 'sees a link to log in for voting' do
    visit week_six_path

    expect(page).to have_link 'Log In', href: login_path
  end
end
