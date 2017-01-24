require 'rails_helper'

RSpec.describe Mypage::QuestionSetsController, type: :controller do
  include_context 'mypage login'

  describe 'GET #show' do
    let(:question_set) { create(:question_set, user: user) }

    let(:get_show) {
      get :show, params: { id: question_set }, session: { user: user }
    }

    context "when the question_set is not current_users'" do
      let(:other_user) { create(:user) }
      let(:question_set) { create(:question_set, user: other_user) }
      before { get_show }
      it { is_expected.to redirect_to mypage_path }
    end

    describe '@question_set' do
      before { get_show }
      subject { assigns(:question_set) }
      it { is_expected.to be_present }
    end

    describe '@question_set.saved_questions' do
      before { get_show }
      subject { assigns(:question_set).reload.saved_questions }

      context 'when no saved_questions' do
        it { is_expected.to be_blank }
      end

      context 'when saved_questions exist' do
        let!(:question) { create(:question, user: user, question_sets: [question_set]) }
        it { is_expected.to be_present }
      end
    end

    describe '@question' do
      before { get_show }
      subject { assigns(:question) }
      it { is_expected.to be_a(Question) }
    end

    describe '@question.scores' do
      before { get_show }
      subject { assigns(:question).scores }
      its(:first) { is_expected.to be_a(QuestionScore) }
      its(:length) { is_expected.to eq 1 }
    end

    describe '@parties' do
      subject { assigns(:parties) }

      context 'when no saved_questions' do
        before { get_show }
        it { is_expected.to be_present }
      end

      context 'when saved_questions exist' do
        before do
          create(:question, user: user, question_sets: [question_set])
          get_show
        end
        its(:count) { is_expected.to eq 2 }
      end
    end
  end

  describe 'POST #create' do
    let(:post_create) do
      post :create, params: { question_set: { title: 'テスト' } }, session: { user: user }
    end

    describe 'user.question_set' do
      it { expect { post_create }.to change { user.question_sets.count }.by(1) }
    end

    describe 'redirect path' do
      before { post_create }
      let(:question_set) { QuestionSet.last }
      it { is_expected.to redirect_to mypage_question_set_path(question_set) }
    end
  end
end
