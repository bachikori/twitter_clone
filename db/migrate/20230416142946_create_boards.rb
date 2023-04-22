# frozen_string_literal: true

class CreateBoards < ActiveRecord::Migration[7.0]
  def change
    create_table :boards do |t|
      t.string :tweet
      t.string :board_image, default: ''
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
