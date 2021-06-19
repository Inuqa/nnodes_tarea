class Roulette < ApplicationRecord
  before_create :spin
  before_create :place_bet

  has_many :bets, dependent: :destroy
  has_many :players, through: :bets

  PROBABILITY_GREEN = 0.02
  PROBABILITY_BLACK = 0.49
  ALL_IN_AMOUNT = 1000
  TEMP_CONSERVATIVE = 20
  BET_RANGE_CONSERVATIVE = (0.03..0.07).freeze
  BET_RANGE_NON_CONSERVATIVE = (0.08..0.15).freeze

  private

  def spin
    self.rand_number = rand
    self.color = generate_color(rand_number)
  end

  def generate_color(random_number)
    return 'green' if random_number <= PROBABILITY_GREEN
    return 'black' if random_number <= PROBABILITY_GREEN + PROBABILITY_BLACK

    'red'
  end

  def place_bet
    players = Player.all
    players.each do |player|
      bets.new(
        player: player,
        bet_quantity: bet_money(player),
        bet_color: generate_color(rand)
      )
    end
  end

  def bet_money(player)
    return player.money if player.money <= ALL_IN_AMOUNT
    return rand(BET_RANGE_CONSERVATIVE) * player.money if conservative?

    rand(BET_RANGE_NON_CONSERVATIVE) * player.money
  end

  def conservative?
    @conservative ||= Weather.new.seven_days_over_temp?(TEMP_CONSERVATIVE)
  end
end
