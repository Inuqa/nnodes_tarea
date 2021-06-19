env :PATH, ENV['PATH']
set :output, 'log/cron_log.log'
set :environment, 'development'

every 1.minute do
  rake 'roulette:spin'
end

every 1.day, at: '0:00 am' do
  rake 'players:refill'
end
