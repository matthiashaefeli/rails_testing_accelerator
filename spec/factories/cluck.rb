require 'faker'

FactoryBot.define do
  factory :cluck do
    content { Faker::ChuckNorris.fact }
    user
  end
end