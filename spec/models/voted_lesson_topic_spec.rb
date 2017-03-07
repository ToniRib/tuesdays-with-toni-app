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

      expect(described_class.pluck(:archived).uniq).to eq [true]
    end
  end
end
