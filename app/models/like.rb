class Like < ApplicationRecord
  belongs_to :cluck
  belongs_to :user
  validates :cluck, uniqueness: { scope: :user }
end
