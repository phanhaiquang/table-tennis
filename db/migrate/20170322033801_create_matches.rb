class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.integer :cup_id
      t.integer :player_1_id
      t.integer :player_2_id
      t.integer :score_1, default: 0
      t.integer :score_2, default: 0

      t.timestamps
    end
  end
end
