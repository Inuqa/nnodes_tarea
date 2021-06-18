class Bet < ApplicationRecord
  after_create :check_win
  before_create :discount_money
  belongs_to :roulette
  belongs_to :player

  def check_win
    green(player) if roulette.color == 'green' && bet_color == roulette.color
    red_or_black(player) if roulette.color == bet_color
  end

  def discount_money
    player.update(money: player.money - bet_quantity)
  end

  def green(player)
    player.update(money: bet_quantity * 15)
  end

  def red_or_black(player)
    player.update(money: player.money + bet_quantity * 2)
  end
end
