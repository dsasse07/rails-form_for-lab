class StudentsController < ApplicationController
  before_action :set_student, only: [:edit, :show, :update, :delete]
  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.create(student_params(:first_name, :last_name))
    if @student.valid?  
      redirect_to student_path(@student)
    else 
      flash[:messages] = new_item.errors.full_messages
      redirect_to new_student_path
    end
  end

  def show

  end

  def edit

  end

  def update
    if @student.update(student_params(:first_name, :last_name))
      redirect_to student_path(@student)
    else 
      flash[:messages] = new_item.errors.full_messages
      redirect_to edit_student_path(@student)
    end
  end

  def destroy

  end

  private

  def student_params(*args)
    params.require(:student).permit(*args)
  end

  def set_student
    @student = Student.find(params[:id])
  end
end
