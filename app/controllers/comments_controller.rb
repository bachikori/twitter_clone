# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @tweets = Tweet.joins(:comments).where(comments: { user_id: @user.id }).distinct.order('created_at DESC').page(params[:page])
  end

  def create
    comment = current_user.comments.build(comment_params)
    tweet = Tweet.find(params[:tweet_id])
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
