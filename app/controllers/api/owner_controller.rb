class Api::OwnerController < ApplicationController

  before_action :set_owner, only: [:show, :update, :destroy]

  def index
    render json: current_user.Owner
  end

  def show
    render json: @owner
  end

  def create
    relationship = current_user.owner.create(relationship_params)
      if owner.save
        render json: owner
      else
        render json: { errors: owner.errors.full_messages.join(',') }, status: 422
      end
  end

  def update
    if @owner.update(owner_params)
      render json: @owner
    else
      render json: { errors: @owner.errors.full_messages.join(',') }, status: 422
    end
  end

  def destroy
    @owner.destroy
  end

private

  def owner_params
    params.require(:owner).permit(:name, :phone, :picture, :id)
  end

  def set_owner
    @owner = Owner.find(params[:id])
  end
end
