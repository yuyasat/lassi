require 'rails_helper'

RSpec.describe Mypage::QuestionsController, type: :controller do
  include_context 'mypage login'

  describe 'GET #index' do
    before do
      get :index, params: {}, session: { user: user }
    end

    describe 'template' do
      it { is_expected.to render_template('index') }
    end

    describe '@question' do
      subject { assigns(:question) }
      it { is_expected.to be_a(Question) }
    end

    describe '@question.scores' do
      subject { assigns(:question).scores }
      its(:first) { is_expected.to be_a(QuestionScore) }
    end

    describe '@questions' do
      subject { assigns(:questions) }

      context 'when user has no questions' do
        it { is_expected.to eq [] }
      end

      context 'when user has two questions' do
        before do
          create(:question, user: user)
          create(:question, user: user)
        end

        its(:first) { is_expected.to be_a(Question) }
        its(:count) { is_expected.to eq 2 }
      end
    end
  end

  describe 'GET #show' do
    let(:question) { create(:question, user: user) }

    before do
      get :show, params: { id: question }, session: { user: user }
    end

    describe 'template' do
      it { is_expected.to render_template('show') }
    end

    describe '@question' do
      subject { assigns(:question) }

      context "question is users'" do
        it { is_expected.to be_a(Question) }
      end

      context "question is other users'" do
        let(:other_user) { create(:user) }
        let(:question) { create(:question, user: other_user) }
        it { is_expected.to redirect_to mypage_path }
      end
    end
  end

  describe 'POST #create' do
    let(:question_params) { attributes_for(:question, user: user, question_set: question_set) }
    let(:score_params) {
      %i(leberal_democratic communist).map.with_index do |party, num|
        [num, attributes_for(:question_score, party).merge(party_id: build(:party, party).id)]
      end.to_h
    }
    let(:params) { { question: question_params.merge(scores_attributes: score_params) } }

    let(:post_create) { post :create, params: params, session: { user: user } }

    context 'when question_set has no hitory' do
      let(:question_set) { create(:question_set, user: user) }

      it 'question belong_to question_set is created and redirect_to mypage_question_set_path' do
        expect { post_create }.to change { question_set.questions.count }.from(0).to(1)
        is_expected.to redirect_to mypage_question_set_path(question_set)
      end
    end

    context 'when question_set has histories' do
      let!(:question_set) {
        create(:question_set, :with_question, :with_history, :visible, user: user)
      }

      it 'question_history is not created' do
        expect { post_create }.not_to change {
          question_set.histories.latest.question_histories.count
        }
      end

      it 'question_set status is invisible' do
        expect { post_create }.to change { question_set.reload.status }.from('visible').to('invisible')
      end
    end
  end

  describe 'POST #update' do
    let(:question) { create(:question, user: user) }
    let(:score_attributes) {
      question.scores.map.with_index do |score, num|
        [num, score.attributes.except('created_at', 'question_id', 'updated_at')]
      end.to_h
    }

    let(:updated_title) { '更新後の質問タイトル' }
    let(:question_params) { { title: updated_title } }
    let(:score_params) {
      score_attributes[0].merge!({ agree: 2, neutral: 4 }.stringify_keys)
      score_attributes
    }
    let(:params) {
      { id: question.id, question: question_params.merge(scores_attributes: score_params) }
    }

    let(:post_update) { post :update, params: params, session: { user: user } }

    describe 'render template' do
      before { post_update }
      it { is_expected.to redirect_to mypage_question_path(question) }
    end

    it 'question title is changed' do
      expect { post_update }.to(
        change { question.reload.title }.from(question.title).to(updated_title)
      )
    end

    it 'scores agree is changed' do
      expect { post_update }.to change { question.scores.reload.first.agree }.from(3).to(2)
    end

    it 'scores neutral is changed' do
      expect { post_update }.to change { question.scores.reload.first.neutral }.from(3).to(4)
    end
  end
end
