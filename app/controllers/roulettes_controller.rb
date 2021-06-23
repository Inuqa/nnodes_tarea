class RoulettesController < ApplicationController
  include CheckCronHeader

  before_action :check_app_engine_cron, only: [:spin]
  def index
    @roulettes = Roulette.all.order(id: :desc)
  end

  def spin
    Roulette.create
    head :ok
  end
end
