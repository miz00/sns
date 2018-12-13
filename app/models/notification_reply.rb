class NotificationReply < ApplicationRecord
  belongs_to :notification
  belongs_to :reply
end
