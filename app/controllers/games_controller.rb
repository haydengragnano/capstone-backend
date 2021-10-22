class GamesController < ApplicationController
  def index
    games = Game.all
    render json: games, each_serializer: GameSerializer
  end

  def show
    game = Game.find(params[:id])
    render json: game, serializer: DetailedGameSerializer, include: "users.tags"
  end
  
end
