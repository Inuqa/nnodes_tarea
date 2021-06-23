require 'rails_helper'

RSpec.describe 'Roulettes', type: :request do
  describe 'GET /spin' do
    it_behaves_like 'cron' do
      let(:create_object) {}
      let(:request_path) { roulettes_spin_path }
      let!(:variable_output) { proc { Roulette.count } }
      let(:variable_amount) { 1 }
    end
  end
end
