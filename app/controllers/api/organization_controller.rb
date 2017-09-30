class Api::OrganizationController < ApplicationControlle
  
  before_action :set_organization, only: [:show, :update, :destroy]

  def index
    render json: current_user.oganizations
  end

  def show
    render json: @organization
  end

  def create
    organization = current_user.organizations.create(organization_params)
    if organization.save
      render json: organization
    else
      render json: { errors: organization.errors.full_messages.join(',') }, status: 422
    end
  end

  def update
    if @organization.update(organization_params)
      render json: @organization
    else
      render json: { errors: @organization.errors.full_messages.join(',') }, status: 422
    end
  end

  def destroy
    @organization.destroy
  end

private

def organization_params
  params.require(:organization).permit(:name, :phone, :id)

  def set_organization
    @organization = Organization.find(params[:id])
  end
end
