# frozen_string_literal: true

class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @tweets = Tweet.joins(:favorites).where(favorites: { user_id: current_user.id }).distinct.order('created_at DESC').page(params[:page])
  end
end
