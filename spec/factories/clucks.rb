FactoryBot.define do
  factory :cluck do
    user
    content { Faker::Lorem.sentence(word_count: 5) }
  end
end
