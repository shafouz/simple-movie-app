FactoryBot.define do
  factory :search do
    query { "MyText" }
    number_of_searches { 1 }
  end
end
