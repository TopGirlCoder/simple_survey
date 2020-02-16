class VotesController < ApplicationController
  before_action :authenticate_user!
  before_action :get_survey
  before_action :set_vote, only: [:show, :edit, :update, :destroy]

  def index
    @votes = @survey.votes.all
  end

  def show
  end

  def new
    @vote = current_user.votes.build
  end

  def edit
  end

  def create
    @vote = current_user.votes.new(vote_params)

    respond_to do |format| 
      if @vote.save
        # format.html { redirect_to survey_vote_path(@survey, @vote), notice: 'Vote was successfully saved. Please find details below.' }
        format.html { redirect_to survey_vote_path(@survey, @vote), notice: 'Vote was successfully saved.' }
      else
        format.html { render :new }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @vote.update(vote_params)
        format.html { redirect_to survey_vote_path(@survey), notice: 'Vote was successfully updated.' }
      else
        format.html { render :edit }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @vote.destroy
    respond_to do |format|
      format.html { redirect_to surveys_url, notice: 'Vote was successfully deleted.' }
    end
  end

  private
    def get_survey
      @survey = Survey.find(params[:survey_id]) 
    end 

    def set_vote
      @vote = current_user.votes.find(params[:id])
    end

    def vote_params
      params.require(:vote).permit(:value, :survey_id)
    end
end
