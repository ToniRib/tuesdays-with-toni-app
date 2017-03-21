require 'rails_helper'

feature 'Logged in user upvoting a topic', js: true do
  let(:user) { create(:user) }
  let(:another_user) { create(:user) }
  let(:suggested_topic) { create(:suggested_topic, name: 'ActiveRecord') }

  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    create(:user_vote, user: another_user, suggested_topic: suggested_topic)
  end

  context 'when they have already voted for a non-archived topic' do
    before { create(:user_vote, user: user, suggested_topic: suggested_topic) }

    scenario 'cannot upvote on page load' do
      visit week_six_path

      within("#suggested-topic-#{suggested_topic.id}") do
        expect(page).not_to have_css '.upvote'
      end
    end
  end

  context 'when they have not already voted for a non-archived topic' do
    scenario "votes for the topic once" do
      visit week_six_path

      within("#suggested-topic-#{suggested_topic.id}") do
        find('.upvote').click

        expect(page).to have_content 'ActiveRecord (2 votes)'
        expect(page).not_to have_css '.upvote'
      end
    end
  end
end
