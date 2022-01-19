class Post < ApplicationRecord
  attachment :sauna_image

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  geocoded_by :address
  after_validation :geocode

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  def liked(user)
    likes.find_by(user_id: user.id)
  end
  
  # 検索方法分岐
  def self.search_for(content, method)
    if method == 'perfect'
      Post.where(sauna_name: content)
    elsif method == 'forward'
      Post.where('sauna_name LIKE ?', content+'%')
    elsif method == 'backward'
      Post.where('sauna_name LIKE ?', '%'+content)
    else
      Post.where('sauna_name LIKE ?', '%'+content+'%')
    end
  end

  validates :sauna_name, presence: true
  validates :address, presence: true
  validates :url, presence: true
  validates :sauna_image, presence: true
  validates :sauna_temperature, presence: true
  validates :water_bath_temperature, presence: true
  validates :outside_air_bath, presence: true
  validates :congestion, presence: true
  validates :time_zorn, presence: true
  validates :vending_machine, presence: true
  validates :evaluation, presence: true
end