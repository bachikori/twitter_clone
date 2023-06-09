# frozen_string_literal: true

class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @tweets = Tweet.joins(:favorites).where(favorites: { user_id: @user.id }).distinct.order('created_at DESC').page(params[:page])
  end

  def create
    tweet = Tweet.find(params[:tweet_id])
    favorite = current_user.favorites.new(tweet_id: tweet.id)
    favorite.save!
    redirect_to request.referer
  end

  def destroy
    tweet = Tweet.find(params[:tweet_id])
    favorite = current_user.favorites.find_by!(tweet_id: tweet.id)
    favorite.destroy!
    redirect_to request.referer
  end
end
