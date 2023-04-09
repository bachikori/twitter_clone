# frozen_string_literal: true

class AddSignupColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :nickname, :string, null: false, default: ''
    add_column :users, :birthday, :date
    add_column :users, :tel_number, :string
  end
end
