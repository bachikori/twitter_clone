# frozen_string_literal: true

class ChangeUsersColumnToNull < ActiveRecord::Migration[7.0]
  def up
    change_column_null :users, :user_image, true
    change_column_null :users, :header_image, true
  end

  def down
    change_column_null :users, :user_image, false
    change_column_null :users, :header_image, false
  end
end
