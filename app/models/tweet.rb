class Tweet < ApplicationRecord
  belongs_to :user
  has_many :images, dependent: :destroy
  has_many :replies, dependent: :destroy
  has_one :my_reply, class_name: 'Reply', :foreign_key => 'tweet_id', :primary_key => 'id'
  has_many :replies, foreign_key: 'target_tweet_id', dependent: :destroy
  has_many :favs, dependent: :destroy
  #has_one :replied_target_tweet, through: :replies, source: :target_tweet
  has_one :replied_target_tweet, class_name: 'Reply', :foreign_key => 'target_tweet_id'

  validates :text, presence: true
  
  enum privacy_status: { everyone: 1, followers: 2, me: 3 }

  # is_reply?(t.id)
  def self.is_reply?(tweet_id)
    Reply.where(tweet_id: tweet_id).present?
  end

  # has_fav?(t.id,current_user.id)
  def self.has_fav(tweet_id, user_id)
    Fav.find_by(tweet_id: tweet_id, user_id: user_id)
  end
end
