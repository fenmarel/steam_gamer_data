# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


raw = JSON.parse(
      RestClient.get("http://api.steampowered.com/" +
                     "ISteamApps/GetAppList/v0002/"))

raw["applist"]["apps"].each do |app|
  Game.create(appid: app["appid"], name: app["name"])
end