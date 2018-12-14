class NotificationReply < ApplicationRecord
  belongs_to :notification, dependent: :destroy
  belongs_to :reply
end
