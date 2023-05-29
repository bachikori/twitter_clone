# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tweets = Tweet.joins(:comments).where(comments: { user_id: current_user.id }).distinct.order('created_at DESC').page(params[:page])
  end

  def create
    tweet = Tweet.find(params[:tweet_id])
    comment = current_user.comments.build(comment_params)
    comment.tweet_id = tweet.id
    if comment.save
      flash[:notice] = 'コメントしました'
    else
      flash[:alert] = 'コメントできませんでした'
    end
    redirect_to tweet_path(tweet.id)
  end

  private

  def comment_params
    params.permit(:comment)
  end
end
