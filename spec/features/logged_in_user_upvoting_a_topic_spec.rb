require 'rails_helper'

feature 'Logged in user upvoting a topic', js: true do
  let(:user) { create(:user) }
  let(:suggested_topic) { create(:suggested_topic, name: 'ActiveRecord') }
  let!(:user_vote) { create(:user_vote, user: user, suggested_topic: suggested_topic) }

  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  scenario "sees the topic's vote count increase by 1" do
    visit week_six_path

    within("#suggested-topic-#{suggested_topic.id}") do
      find('.upvote').click

      expect(page).to have_content 'ActiveRecord (2 votes)'
    end
  end

  scenario 'cannot vote for that same topic again' do
    visit week_six_path

    within("#suggested-topic-#{suggested_topic.id}") do
      find('.upvote').click
      find('.upvote').click

      expect(page).to have_content 'ActiveRecord (2 votes)'
    end
  end
end
