class Team < ApplicationRecord

  mount_uploader :image, ImageUploader
  has_many :notes
  has_many :votes

  enum course: {ios: "0", web: "1"}

  scope :award_vote_count, -> (award_id){
    where('votes.award_id = ?', award_id).select('teams.id, teams.name, count(votes.id) AS vote_count').distinct.group('teams.id').order('vote_count desc')
  }

  def vote_percentage(award)
    (self.vote_count * 100) / award.teams.count
  end
end
