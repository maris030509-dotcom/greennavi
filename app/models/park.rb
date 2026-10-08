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

  belongs_to :user
  belongs_to :prefecture, optional: true

  has_many :park_playgrounds
  has_many :playgrounds, through: :park_playgrounds
  has_many :park_equipments
  has_many :equipments, through: :park_equipments

  validates :name, presence: true
  validates :prefecture_id, presence: true
  validates :address, presence: true
end
