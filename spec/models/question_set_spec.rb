require 'rails_helper'

RSpec.describe QuestionSet, type: :model do
  describe '#result' do
    let!(:question_set) { create(:question_set) }
    let!(:question1) { create(:question, question_sets: [question_set]) }
    let!(:question2) { create(:question, question_sets: [question_set]) }
    let(:leberal_democratic) { create(:party, :leberal_democratic) }
    let(:communist) { create(:party, :communist) }

    before do
      question1.scores.find_by(party: leberal_democratic)
               .update!(agree: 2, neutral: 3, opposition: 5)
      question1.scores.find_by(party: communist).update!(agree: 6, neutral: 3, opposition: 1)
    end

    let(:choice_params) { { question1.id => 'agree', question2.id => 'opposition' }.stringify_keys }
    subject { question_set.results(choice_params) }

    let(:expectation) {
      [
        { party: leberal_democratic, total: 6, percentage: 30 },
        { party: communist, total: 10, percentage: 50 },
      ]
    }
    it { is_expected.to contain_exactly(*expectation) }
  end

  describe '#create_question_set_history' do
    context 'when no questions' do
      let(:question_set) { create(:question_set) }
      it { expect { question_set }.not_to change { question_set.histories.count } }
    end

    context 'when make question_set visible' do
      let(:question_set) { create(:question_set, :with_question) }
      it { expect { question_set.visible! }.to change { question_set.histories.count }.by(1) }
    end
  end

  describe '#be_invisible' do
    context 'add question' do
      let(:question_set) { create(:question_set, status, :with_question) }
      let(:new_question) { create(:question) }

      let(:add_question) {
        question_set.questions << new_question
        question_set.save
      }

      context 'when question_set is visible' do
        let(:status) { :visible }
        it 'change status to invisible' do
          expect { add_question }.to change { question_set.status }.from('visible').to('invisible')
        end
      end

      context 'when question_set is invisible' do
        let(:status) { :invisible }
        it { expect { add_question }.not_to change { question_set.status } }
      end

      context 'when status changed' do
        let(:status) { :invisible }
        it { expect { question_set.visible! }.to change { question_set.status }.to('visible') }
      end
    end
  end
end
