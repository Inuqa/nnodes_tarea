class Player < ApplicationRecord
  has_many :bets, dependent: :destroy
  has_many :roulettes, through: :bets
  validates :name, presence: true

  validates :money, presence: true
end
