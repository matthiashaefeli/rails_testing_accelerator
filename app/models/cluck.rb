class Cluck < ApplicationRecord
  belongs_to :user
  has_many :reclucks
  has_many :likes
  validates :content, presence: true, length: { maximum: 100 }
  validate :content_length
  before_save :strip_content

  def strip_content
    cluck.content = cluck.content.strip
  end

  def content_length
    cluck.errors.add(:base, 'cluck must be 8 words long') if content_word_count != 8
  end

  def content_word_count
    cluck.content.split(' ').count
  end

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
