class RoulettesController < ApplicationController
  def index
    @roulettes = Roulette.all.order(id: :desc)
  end
end
