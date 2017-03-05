require 'rails_helper'

describe ScheduledLesson, type: :model do
  describe 'factory' do
    it 'is valid by default' do
      expect(build(:scheduled_lesson)).to be_valid
    end
  end

  describe '.upcoming' do
    let(:git_lesson) { create(:lesson, name: 'Advanced Git', description: 'Super advanced git') }
    let(:rspec_lesson) { create(:lesson, name: 'RSpec Testing', description: 'Awesome RSpec') }
    let(:active_record_lesson) { create(:lesson, name: 'Active Record', description: 'AR and some SQL') }
    let!(:git_past_lesson) do
      create(:scheduled_lesson, lesson: git_lesson, scheduled_date: 1.day.ago)
    end
    let!(:rspec_upcoming_lesson1) do
      create(:scheduled_lesson, lesson: rspec_lesson, scheduled_date: Date.today)
    end
    let!(:rspec_upcoming_lesson2) do
      create(:scheduled_lesson, lesson: rspec_lesson, scheduled_date: 3.weeks.from_now)
    end
    let!(:active_record_upcoming_lesson) do
      create(:scheduled_lesson, lesson: active_record_lesson, scheduled_date: 2.weeks.from_now)
    end

    it 'returns only lessons scheduled for today or later' do
      expect(described_class.upcoming).to match_array [
        rspec_upcoming_lesson1,
        rspec_upcoming_lesson2,
        active_record_upcoming_lesson,
      ]
    end
  end
end
