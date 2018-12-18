class Tweet < ApplicationRecord
  belongs_to :user
  has_many :images, dependent: :destroy
  has_many :replies, dependent: :destroy
  has_one :my_reply, class_name: 'Reply', :foreign_key => 'tweet_id', :primary_key => 'id', dependent: :destroy
  has_many :replies, foreign_key: 'target_tweet_id', dependent: :destroy
  has_many :favs, dependent: :destroy

  validates :text, presence: true
  
  enum privacy_status: { everyone: 1, followers: 2, me: 3 }

  # is_reply?(t.id)
  def is_reply?
    Reply.where(tweet_id: self.id).present?
  end

  # except_reply_tweets(tweets)
  def self.except_reply_tweets(tweets)
    array = []
    tweets.each do |t|
      unless t.is_reply?
        array.push(t)
      end
    end
    return array
  end

  # has_fav?(t.id,current_user.id)
  def has_fav(user_id)
    Fav.find_by(tweet_id: self.id, user_id: user_id)
  end

  # enable_to_see?(t,current_user)
  def enable_to_see?(current_user)
    self.user_id != current_user.id && self.privacy_status == "me"
  end

end
