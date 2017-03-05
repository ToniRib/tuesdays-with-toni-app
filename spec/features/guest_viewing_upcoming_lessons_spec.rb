require 'rails_helper'

describe 'Guest viewing upcoming lessons', type: :feature do
  let(:git_lesson) { create(:lesson, name: 'Advanced Git', description: 'Super advanced git') }
  let(:rspec_lesson) { create(:lesson, name: 'RSpec Testing', description: 'Awesome RSpec') }
  let(:active_record_lesson) { create(:lesson, name: 'Active Record', description: 'AR and some SQL') }
  let!(:past_lesson) { create(:scheduled_lesson, lesson: git_lesson, scheduled_date: 1.day.ago) }
  let!(:upcoming_lesson1) { create(:scheduled_lesson, lesson: rspec_lesson, scheduled_date: 1.week.from_now) }
  let!(:upcoming_lesson2) { create(:scheduled_lesson, lesson: active_record_lesson, scheduled_date: 2.weeks.from_now) }

  context 'from the home page' do
    scenario 'sees information about all upcoming lessons' do
      visit root_path

      within('#upcoming-lessons') do
        expect(page).to have_content active_record_lesson.name
        expect(page).to have_content rspec_lesson.name
        expect(page).not_to have_content git_lesson.name

        expect(page).to have_content active_record_lesson.description
        expect(page).to have_content rspec_lesson.description
        expect(page).not_to have_content git_lesson.description

        expect(page).to have_content upcoming_lesson1.scheduled_date.strftime('%a, %B %e, %Y')
        expect(page).to have_content upcoming_lesson2.scheduled_date.strftime('%a, %B %e, %Y')
        expect(page).not_to have_content past_lesson.scheduled_date.strftime('%a, %B %e, %Y')
      end
    end
  end

  context 'from the upcoming lessons page' do
    scenario 'sees information about all upcoming lessons' do
      visit upcoming_lessons_path

      within('#upcoming-lessons') do
        expect(page).to have_content active_record_lesson.name
        expect(page).to have_content rspec_lesson.name
        expect(page).not_to have_content git_lesson.name

        expect(page).to have_content active_record_lesson.description
        expect(page).to have_content rspec_lesson.description
        expect(page).not_to have_content git_lesson.description

        expect(page).to have_content upcoming_lesson1.scheduled_date.strftime('%a, %B %e, %Y')
        expect(page).to have_content upcoming_lesson2.scheduled_date.strftime('%a, %B %e, %Y')
        expect(page).not_to have_content past_lesson.scheduled_date.strftime('%a, %B %e, %Y')
      end
    end
  end
end
