require 'faker'

FactoryBot.define do
  factory :cluck do
    content { 'Hello' }
    user
  end
end