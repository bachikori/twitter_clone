# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tweets = Tweet.joins(:comments).where(comments: { user_id: current_user.id }).distinct.order('created_at DESC').page(params[:page])
  end
end
