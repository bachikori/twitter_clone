# frozen_string_literal: true

class ChangeUserColumnDefault < ActiveRecord::Migration[7.0]
  def up
    change_column_default :users, :user_image, nil
    change_column_default :users, :header_image, nil
  end

  def down
    change_column_default :users, :user_image, 'apple.png'
    change_column_default :users, :header_image, 'baroon.jpg'
  end
end
