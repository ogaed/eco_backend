module Api
  class CropsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_crop, only: [:show, :edit, :update, :destroy]

    def create
      puts current_user.id
      @crop = current_user.crops.new(crop_params)

      if @crop.save
        render json: CropSerializer.new(@crop).serializable_hash, status: :ok
      else
        render json: { status: "error", message: "Failed to save crop.", errors: @crop.errors }, status: :unprocessable_entity
      end
    end

    def index
      if current_user.role === "farmer"
        @crops = current_user.crops.all
      else
        @crops = Crop.all
      end
      render json: CropSerializer.new(@crops).serializable_hash
    end

    def show
      cutomer show all
      enum role: [:customer, :farmer, :admin]
    end

    def new
      @crop = Crop.new
    end

    def edit
    end

    def update
      if @crop.update(crop_params)
        redirect_to @crop, notice: "cropo was successfully updated."
      else
        render :edit
      end
    end

    def destroy
      @crop.destroy
      redirect_to products_url, notice: "crop was successfully destroyed."
    end

    private

    def set_crop
      @crop = Crop.find(params[:id])
    end

    def crop_params
      params.require(:crop).permit(:crop_name, :crop_age, :acreage, :trees_0_to_3, :trees_4_to_7, :trees_7_plus, :farm_plot_no, :variety)
    end
  end
end
