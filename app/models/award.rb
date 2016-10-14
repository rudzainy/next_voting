class Award < ApplicationRecord
  has_many :votes
  has_many :teams, -> { distinct }, through: :votes
end
