class GamesController < ApplicationController
  def index
    @games = Game.games_for_user(current_user)
  end
end