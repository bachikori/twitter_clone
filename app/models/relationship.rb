# frozen_string_literal: true

class Relationship < ApplicationRecord
  belongs_to :follower, class_name: 'User', inverse_of: :follower_relationships
  belongs_to :followed, class_name: 'User', inverse_of: :followed_relationships
  # belongs_to :user, class_name: 'User', inverse_of: :follower
  # belongs_to :user, class_name: 'User', inverse_of: :followed
end
