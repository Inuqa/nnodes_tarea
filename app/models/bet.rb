class Bet < ApplicationRecord
  belongs_to :roulette
  belongs_to :player
end
