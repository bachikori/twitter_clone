# frozen_string_literal: true

class Tweet < ApplicationRecord
  mount_uploader :tweet_image, ImageUploader

  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :retweets, dependent: :destroy
  belongs_to :user
end
