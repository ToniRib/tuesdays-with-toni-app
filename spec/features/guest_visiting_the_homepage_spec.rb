require 'rails_helper'

describe 'Guest visiting the homepage', type: :feature do
  scenario 'sees the nav bar' do
    visit root_path

    within('nav') do
      expect(page).to have_link 'Upcoming Lessons', href: upcoming_lessons_path
      expect(page).to have_link 'Week 6 Lesson Vote', href: week_six_path
      expect(page).to have_link 'Contact', href: contact_path
      expect(page).to have_link 'About', href: about_path
    end
  end
end
