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

  describe '.with_vote_counts' do
    let(:popular_topic) { create(:suggested_topic, name: 'Popular') }
    let(:unpopular_topic) { create(:suggested_topic, name: 'Unpopular') }

    before do
      popular_topic.user_votes << create_list(:user_vote, 5)
      unpopular_topic.user_votes << create_list(:user_vote, 1)
    end

    it 'returns records with their number of votes as vote_count' do
      expect(described_class.with_vote_counts.map(&:vote_count)).to match [5, 1]
    end
  end
end
