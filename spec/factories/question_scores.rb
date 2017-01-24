FactoryGirl.define do
  factory :question_score do
    agree      3
    neutral    3
    opposition 4

    trait :leberal_democratic do
      association :party, factory: [:party, :leberal_democratic]
    end

    trait :communist do
      association :party, factory: [:party, :communist]
    end
  end
end
