# frozen_string_literal: true

class Board < ApplicationRecord
  mount_uploader :board_image, ImageUploader

  belongs_to :user
end
