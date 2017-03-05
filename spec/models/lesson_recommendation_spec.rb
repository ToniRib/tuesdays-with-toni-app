require 'rails_helper'

describe LessonRecommendation, type: :model do
  describe 'factory' do
    it 'is valid by default' do
      expect(build(:lesson_recommendation)).to be_valid
    end
  end
end
