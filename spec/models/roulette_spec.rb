require 'rails_helper'

RSpec.describe Roulette, type: :model do
  describe 'associations' do
    it { should have_many(:bets) }
    it { should have_many(:players) }
  end
end
