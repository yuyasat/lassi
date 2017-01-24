FactoryGirl.define do
  factory :question do
    title '政府と中央銀行が協調して経済政策を行うことに賛成ですか?'
    association :user

    after(:build) do |question|
      question.scores << build(:question_score, :leberal_democratic, question: question)
      question.scores << build(:question_score, :communist, question: question)
    end
  end
end
