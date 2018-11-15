class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets, dependent: :destroy
  has_many :favx, dependent: :destroy

  def self.search(search)
      if search
          where(['name LIKE ?',"%#{search}#"])
      else
          all
      end
  end
end
