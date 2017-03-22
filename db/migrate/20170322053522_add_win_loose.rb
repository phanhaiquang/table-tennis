class AddWinLoose < ActiveRecord::Migration[5.0]
  def change
    add_column :cup_players, :win, :integer, default: 0
    add_column :cup_players, :loose, :integer, default: 0
    remove_column :cup_players, :score
  end
end
