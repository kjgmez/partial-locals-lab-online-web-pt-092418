class StudentsController < ApplicationController

  def index
    @students = Student.search(student_params[:name])
    #binding.pry
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student
    else
      render 'new'
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def show
    @student = Student.find(params[:id])
  end

  def student_params
    #raise params.inspect
    params.require(:student).permit(:name, :birthday, :hometown)
  end
end
