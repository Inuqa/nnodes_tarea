class RoulettesController < ApplicationController
  before_action :check_app_engine_cron, only: [:spin]
  def index
    @roulettes = Roulette.all.order(id: :desc)
  end

  def spin
    Roulette.create
    render status: :ok
  end

  private

  def check_app_engine_cron
    render status: :internal_server_error unless request.headers['X-Appengine-Cron']
  end
end
