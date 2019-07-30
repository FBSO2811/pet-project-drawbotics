class PositionsController < ApplicationController
  skip_before_action :authenticate_candidate!
  skip_before_action :authenticate_interviewer!

  before_action :set_position, only: [:show, :edit, :update, :destroy, :find_match, :add_review]


  def index
    @positions = Position.all
  end

  def show
    @interviewers = Interviewer.all
    @position_skills = @position.array_skills
    @matching_expertises_array = []
    @matching_expertises = {}

    @interviewers.each do |interviewer|
      @matching_expertises_array =  interviewer.expertises & @position.array_skills
      @matching_expertises.store(interviewer, @matching_expertises_array)
    end
      @final_expertises_score = Hash[@matching_expertises.sort_by { |k, v| v.length }.reverse!]

    @employees = Employee.all
    @employee_skills = @position.array_skills
    @employee_matching_expertises_array = []
    @employee_matching_expertises = {}

    @employees.each do |employee|
    @employee_matching_expertises_array =  employee.expertises_array & @position.array_skills
    @employee_matching_expertises.store(employee, @employee_matching_expertises_array)
    end
      @employee_final_expertises_score = Hash[@employee_matching_expertises.sort_by { |k, v| v.length }.reverse!]

  end

  def new
    @position = Position.new
  end

  def create
    @position = current_interviewer.positions.new(position_params)

    @position.skills = ""
    @position.array_skills.each do |skill|
      @position.skills = @position.skills + skill + ", "
    end
    @position.skills = @position.skills.chop.chop

    if @position.save
      redirect_to position_path(@position)
      flash[:success] = "You created a new position/opening"

    else
      render :new
    end


  end

  def edit
  end

  def update
    if @position.update(position_params)
      redirect_to position_path(@position)
    else
      render :edit
    end
  end


  def destroy
    if @position.delete
      redirect_to positions_path

    else
      redirect_to position_path(@position)
    end
  end

  def find_match
    @matching_score = {}
    @candidates = Candidate.all
    @matching_skills_array = []
    @candidates.each do |candidate|
      @matching_skills_array = candidate.skill & @position.array_skills
      @matching_score.store(candidate, @matching_skills_array)
    end

    @final_matching_score = Hash[@matching_score.sort_by { |k, v| v.length }.reverse!]


  end

  private

  def set_position
    @position = Position.find(params[:id])
  end

  def position_params
    params.require(:position).permit(:title, :interviewer, array_skills:[])
  end

end
