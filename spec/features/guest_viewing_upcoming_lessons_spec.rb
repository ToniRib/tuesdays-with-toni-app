require 'rails_helper'

describe 'Guest viewing upcoming lessons', type: :feature do
  let(:backend_program) { create(:program, name: 'Backend Engineering', abbreviation: 'BEE') }
  let(:frontend_program) { create(:program, name: 'Frontend Engineering', abbreviation: 'FEE') }
  let(:mod1) { create(:mod, name: 'mod1') }
  let(:mod2) { create(:mod, name: 'mod2') }
  let(:backend_mod1) { create(:program_mod, program: backend_program, mod: mod1) }
  let(:frontend_mod2) { create(:program_mod, program: frontend_program, mod: mod2) }
  let(:git_lesson) { create(:lesson, name: 'Advanced Git', description: 'Super advanced git') }
  let(:rspec_lesson) { create(:lesson, name: 'RSpec Testing', description: 'Awesome RSpec') }
  let(:active_record_lesson) { create(:lesson, name: 'Active Record', description: 'AR and some SQL') }
  let!(:git_past_lesson) { create(:scheduled_lesson, lesson: git_lesson, scheduled_date: 1.day.ago) }
  let!(:upcoming_rspec_lesson) { create(:scheduled_lesson, lesson: rspec_lesson, scheduled_date: 1.week.from_now) }
  let!(:upcoming_active_record_lesson) { create(:scheduled_lesson, lesson: active_record_lesson, scheduled_date: 2.weeks.from_now) }

  before do
    rspec_lesson.recommended_program_mods << backend_mod1
    active_record_lesson.recommended_program_mods << frontend_mod2
  end

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

        expect(page).to have_content upcoming_rspec_lesson.scheduled_date.strftime('%a, %B %e, %Y')
        expect(page).to have_content upcoming_active_record_lesson.scheduled_date.strftime('%a, %B %e, %Y')
        expect(page).not_to have_content git_past_lesson.scheduled_date.strftime('%a, %B %e, %Y')
      end
    end

    scenario 'sees recommended program mods for each lesson' do
      visit root_path

      within("#scheduled-lesson-#{upcoming_rspec_lesson.id}") do
        expect(page).to have_content 'Recommended for: BEE mod1'
      end

      within("#scheduled-lesson-#{upcoming_active_record_lesson.id}") do
        expect(page).to have_content 'Recommended for: FEE mod2'
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

        expect(page).to have_content upcoming_rspec_lesson.scheduled_date.strftime('%a, %B %e, %Y')
        expect(page).to have_content upcoming_active_record_lesson.scheduled_date.strftime('%a, %B %e, %Y')
        expect(page).not_to have_content git_past_lesson.scheduled_date.strftime('%a, %B %e, %Y')
      end
    end
  end
end
