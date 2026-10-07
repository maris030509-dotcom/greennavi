class Equipment < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :park_equipments
  has_many :parks, through: :park_equipments
end
