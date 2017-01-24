FactoryGirl.define do
  sequence(:email) { |n| "email#{n}@yourvote.jp" }

  factory :user do
    email
    password 'yourvote'
  end
end
