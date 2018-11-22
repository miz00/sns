class Reply < ApplicationRecord
  belongs_to :tweet
  belongs_to :target_tweet, class_name: 'Tweet', :foreign_key => "target_tweet_id", :primary_key => 'id', :optional => true
end
