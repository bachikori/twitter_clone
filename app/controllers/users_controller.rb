# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @tweets = current_user.tweets.all.order('created_at DESC').page(params[:page])
  end
end
