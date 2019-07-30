class EmployeesController < ApplicationController

  skip_before_action :authenticate_interviewer!, only: [:new, :create, :index, :show, :edit, :destroy]
  skip_before_action :authenticate_candidate!, only: [:new, :create, :index, :show, :edit, :destroy]

  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  def index
    @employees = Employee.all
  end

  def show

  end


  def new
    @employee = Employee.new

  end

  def create
    @employee = Employee.new(employee_params)
    @employee.interviewer = current_interviewer
    if @employee.save
      redirect_to employees_path
      flash[:success] = "You applied"
    else
      flash[:alert] = "Something went wrong, try again"
    end
  end


  def edit
  end

  def update
    if @employee.update(employee_params)
      redirect_to employee_path(@employee)
    else
      render :edit
    end
  end


  def destroy
    if @employee.delete
      redirect_to employees_path

    else
      redirect_to employee_path(@employee)
    end
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:interviewer, :firstname, :lastname, :position, :email,   expertises_array:[])
  end
end
