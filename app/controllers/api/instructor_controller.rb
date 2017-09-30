class Api::InstructorController < ApplicationController

  before_action :set_instructor, only: [:show, :update, :destroy]

  def index
    render json: current_user.instructors
  end

  def show
    render json: @instructor
  end

  def create
    instructor = current_user.instructors.create(instructor_params)
    if @instructor.save
      render json: instructor
    else
      render json: { errors: instuctor.errors.full_messages.join(',') }, status: 422
    end
  end

  def update
    if@instructor.update(instructor_params)
      render json: @instructor
    else
      render json: { errors: @instructor.errors.full_messages.join(',') }, status: 422
    end
  end

  def destroy
    @instructor.destroy
  end

private

  def instructor_params
    params.require(:instructor).permit(:name, :nickname, :dob, :picture, :maiden_name,
    :tag, :template, :id)

  def set_instructor
    @instructor = Instructor.find(params[:id])
  end
end
