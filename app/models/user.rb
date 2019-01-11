# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets, dependent: :destroy
  has_many :favs, dependent: :destroy
  has_many :follows, dependent: :destroy
  has_many :follows, foreign_key: 'target_user_id', dependent: :destroy
  has_many :notifications, dependent: :destroy

  include ImageUploader[:image]

  validates :name, presence: true

  def self.search(search)
    where(['name LIKE ?', "%#{search}%"]) if search && search != ''
  end
end
