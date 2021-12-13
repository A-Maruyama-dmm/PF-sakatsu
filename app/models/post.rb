class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
  attachment :image
end
