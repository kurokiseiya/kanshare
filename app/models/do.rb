class Do < ApplicationRecord
  belongs_to :user
  has_many :do_comments, dependent: :destroy
  
  validates :do_text, presence: true, length: { maximum: 300 }
end
