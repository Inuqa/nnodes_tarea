class RoulettesController < ApplicationController
  def index
    @roulettes = Roulette.all
  end
end
