class Cluck < ApplicationRecord
  belongs_to :user
  has_many :reclucks
  has_many :users, through: :reclucks
  validates :content, presence: true
end
