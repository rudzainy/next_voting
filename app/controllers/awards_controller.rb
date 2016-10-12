class AwardsController < ApplicationController

  def show
    @award = Award.find(params[:id])
    @vote = Vote.new
    @teams = Team.all
  end

end
