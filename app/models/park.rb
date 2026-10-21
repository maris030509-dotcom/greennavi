class Park < ApplicationRecord
  has_one_attached :park_image
  def get_park_image(width, height)
    if park_image.attached?
      park_image.variant(resize_to_limit:[width, height]).processed
    else
      #デフォルト画像
      "no_image.png"
    end
  end

  def favorited_by?(user)
    favorites.exists?(user: user)
  end

  belongs_to :user
  belongs_to :prefecture, optional: true

  has_many :park_playgrounds, dependent: :destroy
  has_many :playgrounds, through: :park_playgrounds, dependent: :destroy
  
  has_many :park_equipments, dependent: :destroy
  has_many :equipments, through: :park_equipments, dependent: :destroy
  
  has_many :park_comments, dependent: :destroy
  
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user 
  
  validates :name, presence: true
  validates :prefecture_id, presence: true
  validates :address, presence: true
end
