require 'rails_helper'

RSpec.describe 'Players', type: :request do
  describe 'GET /refill' do
    it_behaves_like 'cron' do
      let(:create_object) { Player.create(name: 'p-1') }
      let(:request_path) { players_refill_path }
      let(:variable_output) { proc { create_object.reload.money } }
      let(:variable_amount) { (ENV['REFILL_AMOUNT'].to_i || 10_000) }
    end
  end
end
