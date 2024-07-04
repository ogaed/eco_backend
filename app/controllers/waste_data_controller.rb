class WasteDataController < ApplicationController
    before_action :authenticate_user!

    def index
      @waste_data = current_user.waste_data
      render json: @waste_data
    end
  
    def create
      @waste_datum = current_user.waste_data.build(waste_data_params)
      if @waste_datum.save
        render json: @waste_datum, status: :created
      else
        render json: @waste_datum.errors, status: :unprocessable_entity
      end
    end
  
    private
  
    def waste_data_params
      params.require(:waste_data).permit(:date_recorded, :recycling_amount, :composting_amount)
    end
end
