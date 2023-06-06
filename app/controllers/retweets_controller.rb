# frozen_string_literal: true

class RetweetsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tweets = Tweet.joins(:retweets).where(retweets: { user_id: current_user.id }).distinct.order('created_at DESC').page(params[:page])
  end

  def create
    tweet = Tweet.find(params[:tweet_id])
    retweet = current_user.retweets.new(tweet_id: tweet.id)
    retweet.save!
    redirect_to request.referer
  end

  def destroy
    tweet = Tweet.find(params[:tweet_id])
    retweet = current_user.retweets.find_by!(tweet_id: tweet.id)
    retweet.destroy!
    redirect_to request.referer
  end
end
