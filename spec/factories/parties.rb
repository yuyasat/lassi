FactoryGirl.define do
  factory :party do
    trait :leberal_democratic do
      name          '自民党'
      official_name '自由民主党'
      action        :found
      acted_on      '1955-11-15'

      initialize_with do
        Party.find_or_initialize_by(official_name: '自由民主党', acted_on: '1955-11-15')
      end
    end

    trait :communist do
      name          '共産党'
      official_name '日本共産党'
      action        :found
      acted_on      '1945-10-10'

      initialize_with do
        Party.find_or_initialize_by(official_name: '日本共産党', acted_on: '1945-10-10')
      end
    end
  end
end
