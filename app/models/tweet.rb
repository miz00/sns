class Tweet < ApplicationRecord
  belongs_to :user
  has_many :images, dependent: :destroy
  has_many :replies, dependent: :destroy
  has_many :favs, dependent: :destroy

  validates :text, presence: true
end
