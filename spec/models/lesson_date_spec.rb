require 'rails_helper'

describe LessonDate, type: :model do
  describe 'factory' do
    it 'is valid by default' do
      expect(build(:lesson_date)).to be_valid
    end
  end
end
