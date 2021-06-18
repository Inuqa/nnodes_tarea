class Player < ApplicationRecord
  has_and_belongs_to_many :roulettes
  validates :name, presence: true

  validates :money, presence: true
end
