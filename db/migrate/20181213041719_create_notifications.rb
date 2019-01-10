# frozen_string_literal: true

class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.references :user, foreign_key: true
      t.references :target_tweet_user, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
