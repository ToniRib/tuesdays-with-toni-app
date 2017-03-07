require 'rails_helper'

describe 'Guest viewing contact page', type: :feature do
  scenario 'sees contact links' do
    visit contact_path

    expect(page).to have_content 'toni.is.a.verb'
    expect(page).to have_link 'tonimarierib@gmail.com', href: 'mailto:tonimarierib@gmail.com'
    expect(page).to have_link '@tonimarierib', href: 'https://twitter.com/tonimarierib'
    expect(page).to have_link 'linkedin.com/in/ToniRib', href: 'https://linkedin.com/in/ToniRib'
    expect(page).to have_link 'github.com/ToniRib', href: 'https://github.com/ToniRib'
  end
end
