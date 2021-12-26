class User < ApplicationRecord
  attachment :image

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :name, length: {maximum: 20, minimum: 2}
  validates :age,  presence: true
  validates :sauna_years,  presence: true
  validates :number_of_sets,  presence: true
  validates :email, length: {maximum: 20, minimum: 2}

end

