class Image < ApplicationRecord
  belongs_to :tweet
  belongs_to :user
  include ImageUploader[:image]
end
