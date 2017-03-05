require 'rails_helper'

describe VotedLessonTopic, type: :model do
  describe 'factory' do
    it 'is valid by default' do
      expect(build(:voted_lesson_topic)).to be_valid
    end
  end
end
