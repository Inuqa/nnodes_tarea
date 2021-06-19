namespace :roulette do
  desc 'Create a new roulette'
  task spin: :environment do
    Roulette.create
  end
end
