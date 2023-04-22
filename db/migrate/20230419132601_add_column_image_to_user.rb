# frozen_string_literal: true

class AddColumnImageToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :user_image, :string, null: false, default: 'apple.png'
  end
end
