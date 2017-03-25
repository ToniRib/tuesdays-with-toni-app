require 'rails_helper'

feature 'Guest viewing about page', type: :feature do
  scenario 'sees a header' do
    visit about_path

    expect(page).to have_css('h1', text: 'Why do Tuesdays With Toni?')
  end
end
