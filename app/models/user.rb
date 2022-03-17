class User < ApplicationRecord
  attachment :image

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
   
  
  # 検索方法分岐
  def self.search_for(content, method)
    if method == 'perfect'
      User.where(name: content)
    elsif method == 'forward'
      User.where('name LIKE ?', content + '%')
    elsif method == 'backward'
      User.where('name LIKE ?', '%' + content)
    else
      User.where('name LIKE ?', '%' + content + '%')
    end
  end

  validates :name, length: {maximum: 20, minimum: 2}
  validates :age,  presence: true
  validates :sauna_years,  presence: true
  validates :number_of_sets,  presence: true
  validates :email, {presence: true, uniqueness: true}

end

