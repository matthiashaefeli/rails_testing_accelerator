class Cluck < ApplicationRecord
  belongs_to :user
  validates :content, presence: true

  def cluck
    self
  end
end
