require 'rails_helper'

RSpec.feature 'error pages', type: :feature do
  scenario 'public/404.html is displayed' do
    visit '/404'
    expect(page).to have_content "The page you were looking for doesn't exist."
  end

  scenario 'public/500.html is displayed' do
    visit '/500'
    expect(page).to have_content "We're sorry, but something went wrong"
  end
end
