class Book < ApplicationRecord
  belongs_to :user
  attachment :book_image
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  validates :book_title, presence: true, length: { maximum: 19 }
  validates :book_subtitle, presence: true, length: { maximum: 25 }
  validates :book_caption, presence: true
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
