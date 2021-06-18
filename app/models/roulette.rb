class Roulette < ApplicationRecord
  before_create :spin
  has_and_belongs_to_many :players

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
