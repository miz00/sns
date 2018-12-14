class Image < ApplicationRecord
  belongs_to :tweet
  include ImageUploader[:image]
end
