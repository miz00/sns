class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets, dependent: :destroy
  has_many :favx, dependent: :destroy
  has_many :follows, dependent: :destroy
  has_one :image, dependent: :destroy

  include ImageUploader[:image]

  def self.search(search)
    if search && search != ""
      where(['name LIKE ?',"%#{search}%"])
    end
  end
end
