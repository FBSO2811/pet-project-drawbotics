class CandidaturesController < ApplicationController
  skip_before_action :authenticate_candidate!
  skip_before_action :authenticate_interviewer!

  before_action :set_candidature, only: [:show, :edit, :update, :destroy, :add_review]


def edit
  @position = Position.find(params[:position_id])
  @candidature = Candidature.find(params[:id])
end

def update
  @position = Position.find(params[:position_id])
  @candidature = Candidature.find(params[:id])
  if @candidature.update(candidature_params)
        redirect_to position_candidatures_path(@position)
    else
      render :edit
    end
end

  def index
    @candidatures = Candidature.all
    @position = Position.find(params[:position_id])
  end

  def show
  end

  def new
    @position = Position.find(params[:position_id])
    @candidature = Candidature.new

    @matching_skills_array = []

    candidate_skills_array = current_candidate.skill
    position_skills_array = @position.array_skills

    @matching_skills_array = candidate_skills_array & position_skills_array


    @matching_skills_string = ""
    @matching_skills_array.each do |skill|
      @matching_skills_string = @matching_skills_string + skill + ", "
    end
    @matching_skills_string = @matching_skills_string.chop.chop

  end


  def create
    @position = Position.find(params[:position_id])
    @candidature = Candidature.new
    @candidature.candidate = current_candidate
    @candidature.position = @position
    @candidature.interviewer = @position.interviewer
    if @candidature.save
      redirect_to my_candidatures_path
      flash[:success] = "You applied"
    else
      redirect_to position_path(@position)
      flash[:alert] = "Something went wrong, try again"
    end
  end

  def destroy
    if @candidature.delete
      redirect_to my_candidatures_path

    else
      redirect_to position_candidature_path(@candidature)
    end
  end


  private

  def set_candidature
    @position = Position.find(params[:position_id])
  end

  def candidature_params
    params.require(:candidature).permit(:position, :review)
  end



end
