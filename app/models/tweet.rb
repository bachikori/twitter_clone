# frozen_string_literal: true

class Tweet < ApplicationRecord
  mount_uploader :tweet_image, ImageUploader

  belongs_to :user
end
