# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable, :omniauthable, omniauth_providers: [:github]

  validates :nickname, presence: true
  validates :email, presence: true
  validates :uid, presence: true, uniqueness: { scope: :provider }

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
