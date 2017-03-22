class Player < ApplicationRecord
  has_many :cup_players, dependent: :destroy
  has_many :cups, through: :cup_players, dependent: :destroy
end
