class TeamsController < ApplicationController

  def index
    @teams = Team.all
    @awards = Award.all
  end

  def show
    @team = Team.find(params[:id])
  end


end
