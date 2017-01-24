require 'rails_helper'

RSpec.feature 'Delete QuestionSet', type: :feature do
  include_context 'my page login in feature'
  let!(:question_set) { create(:question_set, :visible, :with_question, user: user) }

  scenario 'Delete QuestionSet successfully', :js do
    visit mypage_path

    expect { first('.j__delete_question_set').click }.to change {
      user.question_sets.reload.count
    }.by(-1)
  end
end
