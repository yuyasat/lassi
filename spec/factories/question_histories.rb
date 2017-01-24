FactoryGirl.define do
  factory :question_history do
    title '20XX年衆議院選挙!あなたの選択は?!'
    scores(
      [{ 1 => { agree: 2, neutral: 3, opposition: 5 } },
       { 2 => { agree: 6, neutral: 2, opposition: 2 } }]
    )
  end
end
