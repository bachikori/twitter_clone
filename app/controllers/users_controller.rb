# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @tweets = current_user.tweets.all.order('created_at DESC').page(params[:page])
  end
end
