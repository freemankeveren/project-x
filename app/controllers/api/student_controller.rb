class Api::StudentController < ApplicationController

  before_action :set_student, only: [:show, :update, :destroy]

  def index
    render json: current_user.student
  end

  def show
    render json: @student
  end

  def create
    student = current_user.students.create(student_params)
    if student.save
      render json: student
    else
      render json: { errors: instructor.errors.full_messages.join(',') }, status: 422
    end
  end

  def update
    if @student.update(sudent_params)
      render json: @student
    else
      render json { errors: @student.errors.full_messages.join(',') }, status: 422
  end

  def destroy
    @student.destroy
  end

private

  def student_params
    params.require(:student).permit(:name, :nickname, :dob, :picture, :maiden_name,
    :tag, :template, :id)

  def set_student
    @rstudent = Student.find(params[:id])
end
