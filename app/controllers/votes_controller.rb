class VotesController < ApplicationController
  before_action :set_vote, only: [:show, :edit, :update, :destroy]

  # GET /votes
  # GET /votes.json
  def index
    @votes = Vote.all
  end

  # GET /votes/1
  # GET /votes/1.json
  def show
  end

  # GET /votes/new
  def new
    @vote = Vote.new
  end

  # GET /votes/1/edit
  def edit
  end

  # POST /votes
  # POST /votes.json
  def create
    if params[:vote][:team_id].count > 3
      flash[:danger] = "You can only vote up to three (3) teams."
      redirect_to award_path(params[:award_id])
    else
      current_user.votes.destroy_all
      params[:vote][:team_id].each do |team_id|
        vote = Vote.new(vote_params)
        vote.team_id = team_id
        vote.save
      end
      flash[:success] = 'Your vote(s) was successfully recorded.'
      redirect_to root_path
    end

    # respond_to do |format|
    # #   if @vote.save
    #     format.html { redirect_to root_path, notice: 'Vote was successfully created.' }
    #     # format.json { render "awards#show", status: :created }
    # #   else
    # #     format.html { render :new }
    # #     format.json { render json: @vote.errors, status: :unprocessable_entity }
    # #   end
    # end
  end

  # PATCH/PUT /votes/1
  # PATCH/PUT /votes/1.json
  def update
    respond_to do |format|
      if @vote.update(vote_params)
        format.html { redirect_to @vote, notice: 'Vote was successfully updated.' }
        format.json { render :show, status: :ok, location: @vote }
      else
        format.html { render :edit }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /votes/1
  # DELETE /votes/1.json
  def destroy
    @vote.destroy
    respond_to do |format|
      format.html { redirect_to votes_url, notice: 'Vote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vote
      @vote = Vote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vote_params
      params.require(:vote).permit(:user_id, :team_id, :award_id)
    end
end
