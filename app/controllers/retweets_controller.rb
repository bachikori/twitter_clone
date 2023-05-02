# frozen_string_literal: true

class RetweetsController < ApplicationController
  def index
    @tweets = Tweet.joins(:retweets).where(retweets: { user_id: current_user.id }).distinct.order('created_at DESC').page(params[:page])
  end
end
