# frozen_string_literal: true

class Tweet < ApplicationRecord
  mount_uploader :tweet_image, ImageUploader

  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :retweets, dependent: :destroy
  belongs_to :user

  validates :body, length: { maximum: 140 }

  def favorited_by?(user)
    return unless user

    favorites.where(user_id: user.id).exists?
  end
end
