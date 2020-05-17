class Cluck < ApplicationRecord
  belongs_to :user
  has_many :reclucks
  has_many :likes
  validates :content, presence: true

  def cluck
    self
  end

  def liked_by?(user)
    likes.exists?(user: user)
  end

  def like_for(user)
    likes.find_by(user: user)
  end

  def reclucked_by?(user)
    reclucks.exists?(user: user)
  end

  def recluck_for(user)
    reclucks.find_by(user: user)
  end
end
