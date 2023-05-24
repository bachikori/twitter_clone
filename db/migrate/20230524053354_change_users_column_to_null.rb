# frozen_string_literal: true

class ChangeUsersColumnToNull < ActiveRecord::Migration[7.0]
  def change
    change_column_null :users, :user_image, true
    change_column_null :users, :header_image, true
  end
end
