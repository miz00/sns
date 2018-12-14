class Fav < ApplicationRecord
  belongs_to :tweet
  belongs_to :user
  belongs_to :fav_tweet, foreign_key: 'tweet_id', class_name: 'Tweet'
  has_one :notification_fav, dependent: :destroy
  has_one :notification, :through => :notification_fav, dependent: :destroy
  validates :user_id, uniqueness: { scope: [:tweet_id] }
end
