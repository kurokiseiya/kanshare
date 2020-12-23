class DoComment < ApplicationRecord
  belongs_to :user
  belongs_to :do
    
  validates :todo_comment, presence: true, length: { maximum: 300 }
end
