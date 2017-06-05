class AddStarToMatch < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :star_1, :integer, default: 0
    add_column :matches, :star_2, :integer, default: 0
  end
end
