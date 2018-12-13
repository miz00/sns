class Notification < ApplicationRecord
  belongs_to :user
  has_many :notification_favs, dependent: :destroy
  has_many :notification_replies, dependent: :destroy
end
