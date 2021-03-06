class Api::FundingOrgsController < ApplicationController
  before_action :authenticate_user

  def index
    # @funding_orgs = FundingOrg.all
    @funding_orgs = FundingOrg.where(organization_id: params[:organization_id])

    @funding_orgs = @funding_orgs.order(:name)

    render "index.json.jb"
  end

  def create
    @funding_org = FundingOrg.new(
      website: params[:website],
      name: params[:name],
      organization_id: params[:organization_id],
      # archived: false
    )
    if @funding_org.save
      render "show.json.jb"
    else
      render json: { errors: @funding_org.errors.messages }, status: :unprocessable_entity
    end
  end

  def show
    @funding_org = FundingOrg.find(params[:id])
    render "show.json.jb"
  end

  def update
    @funding_org = FundingOrg.find(params[:id])

    @funding_org.website = params[:website] || @funding_org.website
    @funding_org.name = params[:name] || @funding_org.name
    @funding_org.organization_id = params[:organization_id] || @funding_org.organization_id
    @funding_org.archived = params[:archived].nil? || @funding_org.archived
    if @funding_org.save
      render "show.json.jb"
    else
      render json: { errors: @funding_org.errors.messages }, status: :unprocessable_entity
    end
  end

  def destroy
    funding_org = FundingOrg.find(params[:id])
    funding_org.destroy
    render json: { message: "Funding Org successfully destroyed." }
  end
end
