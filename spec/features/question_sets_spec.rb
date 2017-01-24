require 'rails_helper'

RSpec.feature 'show /question_set/:id', type: :feature do
  given!(:question_set) { create(:question_set) }
  given!(:question1) { create(:question, question_sets: [question_set]) }
  given!(:question2) { create(:question, question_sets: [question_set]) }

  scenario 'check toggle css', :js do
    visit question_set_path(question_set)

    [question1, question2].each do |question|
      within ".feature_#{question.id}" do
        expect(page).not_to have_css('div.question-agree-click')
        expect(page).not_to have_css('div.question-neutral-click')
        expect(page).not_to have_css('div.question-opposition-click')

        find('.question-agree').click
        page.has_css?('div.question-agree-click')

        find('.question-neutral').click
        expect(page).to have_css('div.question-neutral-click')
        expect(page).not_to have_css('div.question-agree-click')

        find('.question-opposition').click
        expect(page).to have_css('div.question-opposition-click')
        expect(page).not_to have_css('div.question-neutral-click')
      end
    end
  end
end
