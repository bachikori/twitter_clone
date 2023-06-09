# frozen_string_literal: true

class BookmarksController < ApplicationController
  before_action :authenticate_user!

  def index
    @tweets = Tweet.joins(:bookmarks).where(bookmarks: { user_id: current_user.id }).distinct.order('created_at DESC').page(params[:page])
  end

  def create
    tweet = Tweet.find(params[:tweet_id])
    bookmark = current_user.bookmarks.new(tweet_id: tweet.id)
    bookmark.save!
    redirect_to request.referer
  end

  def destroy
    tweet = Tweet.find(params[:tweet_id])
    bookmark = current_user.bookmarks.find_by!(tweet_id: tweet.id)
    bookmark.destroy!
    redirect_to request.referer
  end
end
