# frozen_string_literal: true

class Notification < ApplicationRecord
  belongs_to :user
  has_one :notification_fav, dependent: :destroy
  has_one :notification_reply, dependent: :destroy
  has_one :fav, through: :notification_fav
  has_one :fav_tweet, through: :fav, class_name: 'Tweet'
  has_one :reply, through: :notification_reply
  has_one :reply_tweet, through: :reply, class_name: 'Tweet'

  # is_fav_notification?(notification)
  def is_fav_notification?
    !notification_fav.nil?
  end
end
