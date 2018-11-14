class Tweet < ApplicationRecord
  belongs_to :user
  has_many :images, dependent: :destroy
  has_many :replies, dependent: :destroy
  has_many :replies, foreign_key: 'target_tweet_id', dependent: :destroy
  has_many :favs, dependent: :destroy

  validates :text, presence: true
end
