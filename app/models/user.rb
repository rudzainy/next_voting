class User < ApplicationRecord

  has_many :notes
  has_many :votes

  include Clearance::User

  enum role: {user: "0", admin: "1"}

  def added_note?(team_id)
    return false if Note.find_by(user_id: self.id, team_id: team_id).nil?
    true
  end

  def find_team_note_id(team_id)
    Note.find_by(user_id: self.id, team_id: team_id).id
  end

  def admin?
    self.role == "admin"
  end

  def find_votes(award_id)
    votes = []
    Vote.where(user_id: self.id, award_id: award_id).each do |vote|
      votes << vote.team_id
    end
    votes
  end
end
