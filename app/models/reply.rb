class Reply < ApplicationRecord
  belongs_to :tweet
  belongs_to :reply_tweet, foreign_key: 'tweet_id', class_name: 'Tweet'
  has_one :notification_reply, dependent: :destroy
  has_one :notification, :through => :notification_reply, dependent: :destroy
  belongs_to :target_tweet, class_name: 'Tweet', :foreign_key => "target_tweet_id", :primary_key => 'id', :optional => true
end
