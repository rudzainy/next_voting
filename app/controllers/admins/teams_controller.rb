class Admins::TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  def show
  end

  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to admins_team_path(@team)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @team.destroy
    redirect_to admins_teams_path
  end


  private

  def team_params
    params.require(:team).permit(:name, :description, :image)
  end

  def set_team
    @team = Team.find(params[:id])
  end
end
