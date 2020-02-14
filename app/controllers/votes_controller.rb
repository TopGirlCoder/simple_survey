class VotesController < ApplicationController
  before_action :get_survey
  before_action :set_vote, only: [:show, :edit, :update, :destroy]

  def index
    @votes = @survey.votes.all
  end

  def show
  end

  def new
    @vote = @survey.votes.build
  end

  def edit
  end

  def create
    @vote = @survey.votes.new(vote_params)

    respond_to do |format| 
      if @vote.save
        add_to_voted(@vote.survey_id)
        format.html { redirect_to survey_votes_path(@survey), notice: 'Vote was successfully saved. Please find the details below.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @vote.update(vote_params)
        format.html { redirect_to survey_vote_path(@survey), notice: 'Vote was successfully updated. Please find the details below.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @vote.destroy
    respond_to do |format|
      format.html { redirect_to survey_votes_path(@survey), notice: 'Vote was successfully deleted.' }
    end
  end

  private
    def get_survey
      @survey = Survey.find(params[:survey_id]) 
    end 

    def set_vote
      @vote = @survey.votes.find(params[:id])
    end

    def vote_params
      params.require(:vote).permit(:value, :survey_id)
    end
end
