# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets.all.order('created_at DESC').page(params[:page])
  end

  def edit; end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user.id)
    else
      render 'users/edit', status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :profile, :place, :link, :birthday, :user_image, :header_image)
  end
end
