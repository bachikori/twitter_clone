# frozen_string_literal: true

class AddColumnUserInfoToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :profile, :string, default: ''
    add_column :users, :header_image, :string, null: false, default: 'baroon.jpg'
    add_column :users, :place, :string, default: ''
    add_column :users, :link, :string, default: ''
  end
end
