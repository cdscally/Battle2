require 'sinatra/base'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base

  enable :sessions
  set :session_secret, "secret-session"

  get '/' do
    erb(:index)
  end

 post '/names' do
   $game = Game.new(params[:player1],params[:player2])
   redirect to('/play')
 end

 get '/play' do
   erb(:play)
 end

 post '/hitpoints' do
   erb(:hitpoints)
 end

 get '/attack' do
   $game.attack($game.player_2)
   erb(:attack)
 end

  # run! if app_file == $0

end
