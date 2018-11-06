class Tweet < ApplicationRecord
  belongs_to :user
  has_many :images, dependent: :destroy
  has_many :replies

  validates :text, presence: true
end
