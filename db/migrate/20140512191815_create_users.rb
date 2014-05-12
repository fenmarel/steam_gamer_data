class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, unique: true, null: false
      t.string :email, unique: true, null: false
      t.string :password_digest, null: false
      t.integer :steam_id
    end

    add_index :users, :username
    add_index :users, :email
  end
end
