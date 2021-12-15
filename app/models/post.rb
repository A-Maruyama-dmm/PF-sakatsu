class Post < ApplicationRecord
  attachment :sauna_image

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  # geocoded_by :address
  # after_validation :geocode

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
