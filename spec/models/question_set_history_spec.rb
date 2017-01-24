require 'rails_helper'

RSpec.describe QuestionSet, type: :model do
  describe '#find_or_create_try_history' do
    let(:question_set) { create(:question_set, :invisible) }

    let(:question1) { create(:question) }
    let(:question2) { create(:question) }

    before do
      question_set.questions = [question1, question2]
      question_set.visible!
    end

    let(:choice_params) {
      ActionController::Parameters.new(
        { question1.id => 'neutral', question2.id => 'opposition' }.stringify_keys
      )
    }
    let(:yourresults) { question_set.results(choice_params) }
    let(:find_or_create_try_history) {
      question_set.histories.latest.find_or_create_try_history(choice_params, yourresults)
    }

    context 'when try_histories do not exist' do

      it 'A try_history is created' do
        expect { find_or_create_try_history }.to change {
          question_set.histories.latest.try_histories.count
        }.by(1)
        expect(question_set.histories.latest.try_histories.latest.try_scores.count).to eq 2
      end
    end

    context 'when try_histories exist' do
      before do
        create(:try_history,
               choices: choice_params, question_set_history: question_set.histories.latest)
      end

      it 'try_history is not created' do
        expect { find_or_create_try_history }.not_to change {
          question_set.histories.latest.try_histories.count
        }
      end
    end
  end
end
