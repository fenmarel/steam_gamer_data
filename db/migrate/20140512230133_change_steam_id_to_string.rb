class ChangeSteamIdToString < ActiveRecord::Migration
  def change
    change_column :users, :steam_id, :string
  end
end
