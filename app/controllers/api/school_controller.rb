class Api::SchoolController < ApplicationController

  before_action :set_school, only: [:show, :update, :destroy]

  def index
    render json: current_user.organizations
  end

  def show
    render json: @school
  end

  def create
    school = current_user.schools.create(school_params)
    if school.save
      render json: school
    else
      render json: { errors: schooll.errors.full_messages.join(',') }, status: 422
    end
  end

  def update
    if @school.update(school_parmas)
      render json: @school
    else
      render json: { errors: @school.errors.full_messages.join(',') }, status: 422
  end

  def destroy
    @school.destroy
  end

private

  def school_params
    params.require(:school).permit(:name, :picture, :location, :phone, :id)

  def set_school
    @school = School.find(params[:id])
  end
end
