# frozen_string_literal: true

class ChangePrivacyStatusToTweets < ActiveRecord::Migration[5.2]
  def change
    change_column :tweets, :privacy_status, :integer, default: 1
  end
end
