class Tweet < ApplicationRecord
  belongs_to :user
  has_many :images, dependent: :destroy
  has_many :replies
end
