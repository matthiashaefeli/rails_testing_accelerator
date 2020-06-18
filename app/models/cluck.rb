class Cluck < ApplicationRecord
  belongs_to :user
  has_many :reclucks
  has_many :users, through: :reclucks
  has_many :likes
  validates :content, presence: true
end
