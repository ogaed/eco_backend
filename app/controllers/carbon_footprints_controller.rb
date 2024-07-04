class CarbonFootprintsController < ApplicationController
    before_action :authenticate_user!

    def index
      @carbon_footprints = current_user.carbon_footprints
      render json: @carbon_footprints
    end
  
    def create
      @carbon_footprint = current_user.carbon_footprints.build(carbon_footprint_params)
      if @carbon_footprint.save
        render json: @carbon_footprint, status: :created
      else
        render json: @carbon_footprint.errors, status: :unprocessable_entity
      end
    end
  
    private
  
    def carbon_footprint_params
      params.require(:carbon_footprint).permit(:date_recorded, :value)
    end
end
