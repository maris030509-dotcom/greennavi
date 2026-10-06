class Playground < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :park_playgrounds
  has_many :parks, through: :park_playgrounds
end
