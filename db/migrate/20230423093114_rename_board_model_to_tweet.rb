# frozen_string_literal: true

class RenameBoardModelToTweet < ActiveRecord::Migration[7.0]
  def change
    rename_table :boards, :tweets
    rename_column :tweets, :tweet, :body
    rename_column :tweets, :board_image, :tweet_image
  end
end
