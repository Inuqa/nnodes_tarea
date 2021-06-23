require 'rails_helper'

RSpec.describe Bet, type: :model do
  describe 'associations' do
    it { should belong_to(:roulette) }
    it { should belong_to(:player) }
  end
end
