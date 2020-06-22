FactoryBot.define do
  factory :cluck do
    user
    content { Faker::Lorem.sentence(word_count: 8) }
  end
end
