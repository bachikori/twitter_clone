# frozen_string_literal: true

class BoardsController < ApplicationController
  def top
    @boards = Board.all.order('created_at DESC').page(params[:page])
  end

  def following
    @board_array = []
    current_user.following_user.each do |user|
      following_user_boards = user.boards.order(created_at: :desc)
      @board_array.concat(following_user_boards)
    end
    current_user_boards = current_user.boards.order(created_at: :desc)
    @board_array.concat(current_user_boards)
    @boards = Kaminari.paginate_array(@board_array.sort { |a, b| b.created_at.to_f <=> a.created_at.to_f }).page(params[:page])
  end

  def create
    @board = current_user.boards.build(board_params)
    if @board.save!
      flash[:notice] = 'ツイートしました'
    else
      flash[:alert] = 'ツイートできませんでした'
    end
    redirect_to root_path
  end

  private

  def board_params
    params.permit(:tweet, :board_image, :user_id)
  end
end
