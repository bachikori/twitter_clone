# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable, :omniauthable, omniauth_providers: [:github]

  validates :nickname, presence: true
  validates :email, presence: true
  validates :uid, presence: true, uniqueness: { scope: :provider }
  validates :link, format: { with: /\A#{URI::DEFAULT_PARSER.make_regexp(%w[http https])}\z/ }, allow_blank: true

  has_many :tweets, dependent: :destroy
  has_many :follower_relationships, class_name: 'Relationship', foreign_key: :follower_id, dependent: :destroy, inverse_of: :follower
  has_many :followed_relationships, class_name: 'Relationship', foreign_key: :followed_id, dependent: :destroy, inverse_of: :followed
  has_many :following_users, through: :follower_relationships, source: :followed
  has_many :follower_users, through: :followed_relationships, source: :follower
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :retweets, dependent: :destroy

  mount_uploader :user_image, UserImageUploader
  mount_uploader :header_image, HeaderImageUploader

  def self.find_for_github_oauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create! do |user|
      user.nickname = auth.info.nickname
      user.email = auth.info.email

      user.password = Devise.friendly_token[0, 20]
    end
  rescue StandardError
    User.new(nickname: auth.info.nickname, email: auth.info.email, password: Devise.friendly_token[0, 20], provider: auth.provider, uid: auth.uid)
  end

  def self.create_unique_string
    SecureRandom.uuid
  end

  def follow(user_id)
    follower_relationships.create!(followed_id: user_id)
  end

  def unfollow(user_id)
    follower_relationships.find_by!(followed_id: user_id).destroy!
  end

  def following?(user)
    following_users.include?(user)
  end
end
