# frozen_string_literal: true

class Tweet < ApplicationRecord
  mount_uploader :tweet_image, ImageUploader

  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :retweets, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  belongs_to :user

  validates :body, length: { maximum: 140 }

  def favorited_by?(user)
    return unless user

    favorites.where(user_id: user.id).exists?
  end

  def retweeted_by?(user)
    return unless user

    retweets.where(user_id: user.id).exists?
  end

  def bookmarked_by?(user)
    return unless user

    bookmarks.where(user_id: user.id).exists?
  end
end
