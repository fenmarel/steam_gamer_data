class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :appid, unique: true
      t.string :name
    end

    add_index :games, :appid
    add_index :games, :name
  end
end
