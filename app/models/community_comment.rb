class CommunityComment < ApplicationRecord
  belongs_to :user
  belongs_to :community

  validates :body, presence :true
end
