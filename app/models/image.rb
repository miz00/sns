# frozen_string_literal: true

class Image < ApplicationRecord
  belongs_to :tweet
  include ImageUploader[:image]
end
