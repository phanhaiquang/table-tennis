class CreateCupPlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :cup_players do |t|
      t.integer :cup_id
      t.integer :player_id
      t.integer :score

      t.timestamps
    end
  end
end
