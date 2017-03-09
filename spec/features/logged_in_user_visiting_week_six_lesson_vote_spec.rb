require 'rails_helper'

feature 'Logged in user visiting week six lesson vote' do
  let(:user) { create(:user) }
  let(:active_lesson_topic) { create(:voted_lesson_topic, topic: 'Heroku Addons') }
  let(:archived_lesson_topic) { create(:voted_lesson_topic, topic: 'Pair Programming', archived: true) }

  before do
    create(:user_vote, user: user, voted_lesson_topic: active_lesson_topic)
    create(:user_vote, user: user, voted_lesson_topic: archived_lesson_topic)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  scenario 'sees the currently submitted, non-archived topics' do
    visit week_six_path

    expect(page).to have_content active_lesson_topic.topic
    expect(page).not_to have_content archived_lesson_topic.topic
  end

  scenario 'sees the number of votes for each topic' do
    visit week_six_path

    within("#voted-lesson-topic-#{active_lesson_topic.id}") do
      expect(page).to have_content '(1 vote)'
    end
  end

  scenario 'can vote for a topic' do
    visit week_six_path

    within("#voted-lesson-topic-#{active_lesson_topic.id}") do
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