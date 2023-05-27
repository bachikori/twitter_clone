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
  has_many :follower, class_name: 'Relationship', foreign_key: :follower_id, dependent: :destroy, inverse_of: :user
  has_many :followed, class_name: 'Relationship', foreign_key: :followed_id, dependent: :destroy, inverse_of: :user
  has_many :following_user, through: :follower, source: :followed # 自分がフォローしている人
  has_many :follower_user, through: :followed, source: :follower # 自分をフォローしている人
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
end
