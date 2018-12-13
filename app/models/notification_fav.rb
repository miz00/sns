class NotificationFav < ApplicationRecord
  belongs_to :notification
  belongs_to :fav
end
