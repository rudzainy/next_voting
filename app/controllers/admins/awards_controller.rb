class Admins::AwardsController < ApplicationController

  before_action :set_award, only: [:show, :edit, :update, :destroy]

  def new
    @award = Award.new
  end

  def create
    @award = Award.new(award_params)

    if @award.save
      redirect_to admins_award_path(@award)
    else
      render :new
    end
  end

  def show
  end

  def index
    @awards = Award.all
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def award_params
    params.require(:award).permit(:title)
  end

  def set_award
    @award = Award.find(params[:id])
  end
end
