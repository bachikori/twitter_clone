# frozen_string_literal: true

class TweetsController < ApplicationController
  def top
    @tweets = Tweet.all.order('created_at DESC').page(params[:page])
  end

  def create
    @tweet = current_user.tweets.build(tweet_params)
    if @tweet.save
      flash[:notice] = 'ツイートしました'
    else
      flash[:alert] = 'ツイートできませんでした'
    end
    redirect_to root_path
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  private

  def tweet_params
    params.permit(:body, :tweet_image)
  end
end
