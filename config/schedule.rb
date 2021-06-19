env :PATH, ENV['PATH']
set :output, 'log/cron_log.log'
set :environment, 'development'

every 3.minutes do
  rake 'roulette:spin'
end

every 1.day, at: '0:00 am' do
  rake 'players:refill'
end
