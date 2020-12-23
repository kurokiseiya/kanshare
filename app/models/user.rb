class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :books, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  attachment :profile_image
  has_many :dos, dependent: :destroy
  has_many :do_comments, dependent: :destroy
  
  validates :name, presence: true, length: { maximum: 15 }
  validates :english_name, presence: true, length: { maximum: 20 }
  validates :place, presence: true, length: { maximum: 20 }
  validates :birthday, presence: true, length: { maximum: 20 }
  validates :dream, presence: true, length: { maximum: 50 }
end
