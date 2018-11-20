class Reply < ApplicationRecord
  belongs_to :tweet
  belongs_to :target_tweet, class_name: 'Tweet', :foreign_key => 'id', :primary_key => 'tweet_id'
end
