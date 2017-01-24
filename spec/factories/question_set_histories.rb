FactoryGirl.define do
  factory :question_set_history do
    title '20XX年衆議院選挙!あなたの選択は?!'

    trait :with_question_history do
      after(:build) do |question_set_history|
        question_set_history.question_histories = []
        question_set_history.question_histories << build(:question_history)
      end
    end
  end
end
