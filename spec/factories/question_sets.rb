FactoryGirl.define do
  factory :question_set do
    title '20XX年衆議院選挙!あなたの選択は?!'
    association :user

    trait :visible do
      status :visible
    end
    trait :invisible do
      status :invisible
    end

    trait :with_question do
      after(:build) do |question_set|
        question_set.questions = []
        question_set.questions << build(:question)
      end
    end

    trait :with_history do
      status :visible

      after(:build) do |question_set|
        question_set.histories = []
        question_set.histories << build(:question_set_history, :with_question_history)
      end
    end
  end
end
