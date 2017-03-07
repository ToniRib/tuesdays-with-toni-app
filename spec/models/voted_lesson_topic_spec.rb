require 'rails_helper'

describe VotedLessonTopic, type: :model do
  describe 'factory' do
    it 'is valid by default' do
      expect(build(:voted_lesson_topic)).to be_valid
    end
  end

  describe '.archive_all!' do
    before { create_list(:voted_lesson_topic, 2, archived: false) }

    it 'sets archived to true for all existing records' do
      described_class.archive_all!

      expect(described_class.pluck(:archived).uniq).to match [true]
    end
  end

  describe '.with_vote_counts' do
    let(:popular_topic) { create(:voted_lesson_topic, topic: 'Popular') }
    let(:unpopular_topic) { create(:voted_lesson_topic, topic: 'Unpopular') }

    before do
      popular_topic.user_votes << create_list(:user_vote, 5)
      unpopular_topic.user_votes << create_list(:user_vote, 1)
    end

    it 'returns records with their number of votes as vote_count' do
      expect(described_class.with_vote_counts.map(&:vote_count)).to match [5, 1]
    end
  end
end
