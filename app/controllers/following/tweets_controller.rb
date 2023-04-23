# frozen_string_literal: true

module Following
  class TweetsController < ApplicationController
    def index
      @tweet_array = []
      current_user.following_user.each do |user|
        following_user_tweets = user.tweets.order(created_at: :desc)
        @tweet_array.concat(following_user_tweets)
      end
      current_user_tweets = current_user.tweets.order(created_at: :desc)
      @tweet_array.concat(current_user_tweets)
      @tweets = Kaminari.paginate_array(@tweet_array.sort { |a, b| b.created_at.to_f <=> a.created_at.to_f }).page(params[:page])
    end

    def create
      @tweet = current_user.tweets.build(tweet_params)
      if @tweet.save!
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
