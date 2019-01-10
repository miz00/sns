# frozen_string_literal: true

class NotificationFav < ApplicationRecord
  belongs_to :notification, dependent: :destroy
  belongs_to :fav
end
