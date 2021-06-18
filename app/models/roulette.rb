class Roulette < ApplicationRecord
  before_create :spin
  after_create :place_bet
  has_many :bets, dependent: :destroy
  has_many :players, through: :bets

  def spin
    random_number = rand(10_000)
    self.rand_number = random_number
    self.color = get_color(random_number)
  end

  def get_color(number)
    return 'black' if number <= 4900
    return 'red' if number >= 5100

    'green'
  end
end
