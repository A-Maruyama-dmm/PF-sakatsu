class User < ApplicationRecord
  attachment :image

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :post, dependent: :destroy
  
end
