class AwardsController < ApplicationController

  def show
    @award = Award.find(params[:id])
    @votes = current_user.find_votes(@award.id)
    @vote = Vote.new
    @teams = Team.all
  end

end
