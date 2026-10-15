class ParkComment < ApplicationRecord
  belongs_to :user
  belongs_to :park

  validates :body, presence:true, length: {minimum: 2, maximum: 300}
end
