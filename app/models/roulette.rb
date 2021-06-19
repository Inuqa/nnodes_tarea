class Roulette < ApplicationRecord
  before_create :spin
  before_create :place_bet

  has_many :bets, dependent: :destroy
  has_many :players, through: :bets

  private

  def spin
    self.rand_number = rand
    self.color = generate_color(rand_number)
  end

  def generate_color(random_number)
    return 'green' if random_number <= 0.02
    return 'black' if random_number <= 0.02 + 0.49

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
    return player.money if player.money <= 1000

    rand(0.08..0.15) * player.money
  end
end
