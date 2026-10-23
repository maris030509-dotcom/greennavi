class Community < ApplicationRecord
  has_many :community_memberships, dependent: :destroy
  has_many :users, through: :community_memberships

  has_many :community_comments, dependent: :destroy

  validates :name, presence: true
  validates :introduction, presence: true
end
