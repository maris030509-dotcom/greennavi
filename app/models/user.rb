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

  def active_for_authentication?
    super && is_active?
  end

  def inactive_message
    is_active? ? super : :inactive_account
  end

  validates :name, presence: true
  validates :prefecture_id, presence: true
end
