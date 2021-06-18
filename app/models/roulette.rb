class Roulette < ApplicationRecord
  before_create :spin
  before_create :place_bet
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

  def place_bet
    players = Player.all
    players.each do |player|
      bets.new(player_id: player.id, bet_quantity: bet_money(player), bet_color: get_color(rand(10_000)))
    end
  end

  def bet_money(player)
    return player.money if player.money <= 1000
    return rand(800...player.money) if player.money >= 1001 && player.money <= 1499
    return rand(800...1500) if player.money >= 1500
  end
end
