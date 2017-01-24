class PagesController < ApplicationController
  def index
    @question_sets = QuestionSet.have_questions.visible.new_order.decorate
  end

  def show
  end
end
