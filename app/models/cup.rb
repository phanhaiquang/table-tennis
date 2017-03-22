class Cup < ApplicationRecord
  has_many :matches, dependent: :destroy
  has_many :cup_players, dependent: :destroy
  has_many :players, through: :cup_players, dependent: :destroy
end
