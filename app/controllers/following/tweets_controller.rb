# frozen_string_literal: true

module Following
  class TweetsController < ApplicationController
    before_action :authenticate_user!

    def index
      @tweets = Tweet.where(user: current_user.following_users).order(created_at: 'desc').page(params[:page])
    end

    def create
      @tweet = current_user.tweets.build(tweet_params)
      if @tweet.save
        flash[:notice] = 'ツイートしました'
      else
        flash[:alert] = 'ツイートできませんでした'
      end
      redirect_to following_tweets_path
    end

    private

    def tweet_params
      params.permit(:body, :tweet_image)
    end
  end
end
