# frozen_string_literal: true

class Tweet < ApplicationRecord
  belongs_to :user
  has_many :images, dependent: :destroy
  has_many :replies, dependent: :destroy
  has_one :my_reply, class_name: 'Reply', foreign_key: 'tweet_id', primary_key: 'id', dependent: :destroy
  has_many :replies, foreign_key: 'target_tweet_id', dependent: :destroy
  has_many :favs, dependent: :destroy

  validates :text, presence: true

  enum privacy_status: { everyone: 1, followers: 2, me: 3 }

  # is_reply?(t.id)
  def is_reply?
    self.my_reply.present?
  end

  # except_reply_tweets(tweets)
  def self.except_reply_tweets(tweets)
    tweets.select{|t| [].push(t) unless t.is_reply?}
  end

  # has_fav(t.id,current_user.id)
  def has_fav(user_id)
    #find_byでN+1が発生するので、自分のfavsのlistと該当tweetオブジェクトに対するfavsのlistを照合するなど対策できるそう
    self.favs.find_by(user_id: user_id)
  end

  # enable_to_see?(t,current_user)
  def enable_to_see?(current_user)
    user_id != current_user.id && privacy_status == 'me'
  end
end
