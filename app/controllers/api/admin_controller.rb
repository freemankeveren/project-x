class Api::AdminController < ApplicationController

  before_action :set_admin, only: [:show, :update, :destroy]

  def index
    render json: current_user.admins
  end

  def show
    render json: @admin
  end

  def create
    admin = current_user.admins.create(admin_params)
    if admin.save
      render json: admin
    else
      render json: { errors: admin.errors.full_messages.join(',') }, status: 422
    end
  end

  def update
    if @admin.update(admin_params)
      render json: @admin
    else
      render json: { errors: @admin.errors.full_messages.join(',') }, status: 422
    end
  end

  def destroy
    @admin.destroy
  end

private

  def admin_params
    params.require(:admin).permit(:name, :nickname, :dob, :picture, :maiden_name,
    :tag, :template, :id)

  def set_admin
    @admin = Admin.find(parmas[:id])
end
