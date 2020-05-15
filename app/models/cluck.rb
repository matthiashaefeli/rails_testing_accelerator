class Cluck < ApplicationRecord
  belongs_to :user
  has_many :reclucks
  validates :content, presence: true

  def cluck
    self
  end

  def reclucked_by?(user)
    reclucks.exists?(user: user)
  end

  def recluck_for(user)
    reclucks.find_by(user: user)
  end
end
