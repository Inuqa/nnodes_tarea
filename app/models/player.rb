class Player < ApplicationRecord
  validates :name, presence: true

  validates :money, presence: true
end
