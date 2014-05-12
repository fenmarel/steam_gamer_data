class Game < ActiveRecord::Base
  def self.games_for_user(user)
   raw = JSON.parse(
         RestClient.get( "http://api.steampowered.com/" +
                         "IPlayerService/GetOwnedGames/v0001/" +
                         "?key=#{ENV['STEAM_API_KEY']}" +
                         "&steamid=#{user.steam_id}&format=json"))

   ids = "("
   raw["response"]["games"].each do |game|
     ids << game["appid"].to_s + ", "
   end
   ids = ids[0...-2] << ")"

   Game.where("appid IN #{ids}")
  end
end