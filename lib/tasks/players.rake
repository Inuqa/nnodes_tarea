namespace :players do
  desc 'refill money to all players'
  task refill: :environment do
    Player.all.each do |player|
      player.update(money: player.money + (ENV['REFILL_AMOUNT'].to_i || 10_000))
    end
  end
end
