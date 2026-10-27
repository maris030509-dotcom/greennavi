class User < ApplicationRecord
  # Include default devise modules. Others available a
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  belongs_to :prefecture, optional: true
  has_many :parks
  has_many :park_comments
  has_many :favorites, dependent: :destroy
  has_many :favorite_parks, through: :favorites, source: :park
  has_many :community_memberships, dependent: :destroy
  has_many :communities, through: :community_memberships


  def active_for_authentication?
    super && is_active?
  end

  def inactive_message
    is_active? ? super : :inactive_account
  end
  
  def favorited?(park)
    favorites.exists?(park_id: park.id)
  end

  def self.guest
    find_or_create_by!(email: "guest@example.com") do |user|
      user.name = "ゲストユーザー"
      user.prefecture_id = 1
      user.password = SecureRandom.urlsafe_base64
    end
  end

  def guest_user?
    email == "guest@example.com"
  end

  validates :name, presence: true
  validates :prefecture_id, presence: true
end
