class Recluck < ApplicationRecord
  belongs_to :cluck
  belongs_to :user
  validates :cluck, uniqueness: { scope: :user }
end
