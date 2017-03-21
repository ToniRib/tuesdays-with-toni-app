require 'rails_helper'

describe SuggestedTopic, type: :model do
  describe 'factory' do
    it 'is valid by default' do
      expect(build(:suggested_topic)).to be_valid
    end
  end

  describe 'validations' do
    context 'when creating a topic with a duplicate name' do
      context 'and the original topic is archived' do
        before { create(:suggested_topic, name: 'ActiveRecord', archived: true) }

        it 'is valid' do
          expect(build(:suggested_topic, name: 'ActiveRecord')).to be_valid
        end
      end

      context 'and the original topic is not archived' do
        before { create(:suggested_topic, name: 'ActiveRecord', archived: false) }

        it 'is not valid' do
          expect(build(:suggested_topic, name: 'ActiveRecord')).not_to be_valid
        end

        it 'is not valid even if the case is different' do
          expect(build(:suggested_topic, name: 'activerecord')).not_to be_valid
        end
      end
    end

    context 'when archiving a topic with a duplicate name' do
      before { create(:suggested_topic, name: 'ActiveRecord', archived: true) }

      it 'allows the save' do
        topic = create(:suggested_topic, name: 'ActiveRecord', archived: false)
        topic.archived = true

        expect(topic.save).to be true
      end
    end
  end

  describe '.archive_all!' do
    before { create_list(:suggested_topic, 2, archived: false) }

    it 'sets archived to true for all existing records' do
      described_class.archive_all!

      expect(described_class.pluck(:archived).uniq).to match [true]
    end
  end

  describe '.with_voting' do
    let(:popular_topic) { create(:suggested_topic, name: 'Popular') }
    let(:unpopular_topic) { create(:suggested_topic, name: 'Unpopular') }
    let(:user) { create(:user) }
    let(:another_user) { create(:user) }
    let(:third_user) { create(:user) }

    before do
      popular_topic.user_votes.create!(user: user)
      popular_topic.user_votes.create!(user: third_user)
      unpopular_topic.user_votes.create!(user: user)
    end

    it 'returns records sorted by the number of votes descending' do
      topics_with_votes = described_class.with_voting(user.id)

      expect(topics_with_votes).to match [popular_topic, unpopular_topic]
    end

    it 'returns records with their associated vote count' do
      vote_counts = described_class.with_voting(user.id).map(&:vote_count)

      expect(vote_counts).to match [2, 1]
    end

    context 'when a user has already voted on the topics' do
      it 'returns false for voting_allowed' do
        voting_allowed = described_class.with_voting(user.id).map(&:voting_allowed)

        expect(voting_allowed).to match [false, false]
      end
    end

    context 'when a user has not voted on the topics' do
      it 'returns false for voting_allowed' do
        voting_allowed = described_class.with_voting(another_user.id).map(&:voting_allowed)

        expect(voting_allowed).to match [true, true]
      end
    end
  end
end
